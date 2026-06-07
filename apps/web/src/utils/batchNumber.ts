export function generateBatchNumber(shipperCode: number|string,productCode: number|string, qualityGrade: number|string): string {
    const now = new Date()
    const year = now.getFullYear()
    const month = String(now.getMonth() + 1).padStart(2, '0')
    const day = String(now.getDate()).padStart(2, '0')
    const hours = String(now.getHours()).padStart(2, '0')
    const minutes = String(now.getMinutes()).padStart(2, '0')
    const seconds = String(now.getSeconds()).padStart(2, '0')
    const milliseconds = String(now.getMilliseconds()).padStart(3, '0')
    
    const shipper = shipperCode ? `-${shipperCode}` : ''
    const quality = qualityGrade ? `-${qualityGrade}` : ''
    const product = productCode ? `-${productCode}` : ''
    
    return `BT${year}${month}${day}${product}${shipper}${quality}`
}
