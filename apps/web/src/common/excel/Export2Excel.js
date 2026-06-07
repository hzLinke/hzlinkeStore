/* eslint-disable */
import FileSaver from 'file-saver';
import './Blob';
import * as XLSX from 'xlsx';

import $Util from '@/common/lkxUtil'

function generateArray(table) {
    let out = [];
    let rows = table.querySelectorAll('tr');
    let ranges = [];
    for (let R = 0; R < rows.length; ++R) {
        let outRow = [];
        let row = rows[R];
        let columns = row.querySelectorAll('td');
        for (let C = 0; C < columns.length; ++C) {
            let cell = columns[C];
            let colspan = parseInt(cell.getAttribute('colspan'));
            let rowspan = parseInt(cell.getAttribute('rowspan'));
            let cellValue = cell.innerText;
            if (cellValue !== "" && cellValue == +cellValue) cellValue = +cellValue;
            /*单元地址对象存储为{c:C, r:R}，C和R是列号和行号。例如，单元格地址B5由单元地址对象表示{c:1, r:4}。
                单元格范围对象存储为范围{s:S, e:E}，其中S表示第一个单元格，E表示最后一个单元格。
                例如，范围A3:B7由单元格范围对象表示{s:{c:0, r:2}, e:{c:1, r:6}}
            */
            //Skip ranges
            ranges.forEach(function(range) {
                if (R >= range.s.r && R <= range.e.r && outRow.length >= range.s.c && outRow.length <= range.e.c) {
                    for (let i = 0; i <= range.e.c - range.s.c; ++i) outRow.push(null);
                }
            });

            //Handle Row Span
            if (rowspan || colspan) {
                rowspan = rowspan || 1;
                colspan = colspan || 1;
                ranges.push({ s: { r: R, c: outRow.length }, e: { r: R + rowspan - 1, c: outRow.length + colspan - 1 } });
            };

            //Handle Value
            outRow.push(cellValue !== "" ? cellValue : null);

            //Handle Colspan
            if (colspan) {
                for (let k = 0; k < colspan - 1; ++k) {
                    outRow.push(null);
                }
            }

        }
        out.push(outRow);

    }
    return [out, ranges];
};

function datenum(v, date1904) {
    if (date1904) v += 1462;
    var epoch = Date.parse(v);
    return (epoch - new Date(Date.UTC(1899, 11, 30))) / (24 * 60 * 60 * 1000);
}

function sheet_from_array_of_arrays(data, opts) {
    var ws = {};
    var range = { s: { c: 10000000, r: 10000000 }, e: { c: 0, r: 0 } };
    for (var R = 0; R != data.length; ++R) {
        for (var C = 0; C != data[R].length; ++C) {
            if (range.s.r > R) range.s.r = R;
            if (range.s.c > C) range.s.c = C;
            if (range.e.r < R) range.e.r = R;
            if (range.e.c < C) range.e.c = C;
            var cell = { v: data[R][C] };
           
            if (cell.v == null) continue;
            var cell_ref = XLSX.utils.encode_cell({ c: C, r: R });
            if (cell.v&&cell.v.toString().indexOf('=')==0){
                /**如果第一们是=号，代表是公式 */
                cell.t = 'n';cell.f= cell.v
            }
            if (typeof cell.v === 'number' || $Util.isNumber(cell.v)) cell.t = 'n'; //$Util.isNumber(cell.v)防止json时数字也变成字符串，导出后无法合计求和
            else if (typeof cell.v === 'boolean') cell.t = 'b';
            else if (cell.v instanceof Date && $Util.checkDateTime(cell.v)) {
                cell.t = 'n';
                cell.z = XLSX.SSF._table[14];
                cell.v = datenum(cell.v);
            } else cell.t = 's';
            ws[cell_ref] = cell;
        }
    }
    if (range.s.c < 10000000) ws['!ref'] = XLSX.utils.encode_range(range);
    return ws;
}

function Workbook() {
    if (!(this instanceof Workbook)) return new Workbook();
    this.SheetNames = [];
    this.Sheets = {};
}

function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;
}

export function ExportTableToExcel(theTable) {
    //var theTable = document.getElementById(id);
    //console.log('a')
    var oo = generateArray(theTable);
    var ranges = oo[1];

    /* original data */
    var data = oo[0];
    var ws_name = "SheetJS";
    var wb = new Workbook(),
        ws = sheet_from_array_of_arrays(data);
    /* add ranges to worksheet */
    // ws['!cols'] = ['apple', 'banan'];
    ws['!merges'] = ranges;
    /*ws['!merges'] = [{
        "s": {
            "r": 0,
            "c": 0
        },
        "e": {
            "r": 0,
            "c": 2
        }
    }, {
        "s": {
            "r": 0,
            "c": 3
        },
        "e": {
            "r": 0,
            "c": 5
        }
    }, {
        "s": {
            "r": 0,
            "c": 6
        },
        "e": {
            "r": 0,
            "c": 8
        }
    }, {
        "s": {
            "r": 1,
            "c": 0
        },
        "e": {
            "r": 1,
            "c": 2
        }
    }, {
        "s": {
            "r": 1,
            "c": 3
        },
        "e": {
            "r": 1,
            "c": 5
        }
    }, {
        "s": {
            "r": 1,
            "c": 6
        },
        "e": {
            "r": 1,
            "c": 8
        }
    }]*/

    /* add worksheet to workbook */
    wb.SheetNames.push(ws_name);
    wb.Sheets[ws_name] = ws;
   
    var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: false, type: 'binary' });
    // .setForceFormulaRecalculation(true);
    FileSaver.saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), "导出数据.xlsx")
}

function formatJson(jsonData) {
   // console.log(jsonData)
}
export function ExportJsonToEexcel(th, jsonData, defaultTitle) {

    /* original data */

    var data = jsonData;
    data.unshift(th);
    var ws_name = "SheetJS";

    var wb = new Workbook(),
        ws = sheet_from_array_of_arrays(data);


    /* add worksheet to workbook */
    wb.SheetNames.push(ws_name);
    wb.Sheets[ws_name] = ws;

    var wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: false, type: 'binary' });
    //var title = defaultTitle || '列表'
    FileSaver.saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), "导出数据.xlsx")
}