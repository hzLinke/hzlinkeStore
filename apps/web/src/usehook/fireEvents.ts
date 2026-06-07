/**
 * 触发UI事件
 * @param elem 需要触发事件的DOM对象
 * @param uiEventName ui组件事件名 change|blur|input等
 */
export function fireHtmlEvent(elem: HTMLElement,uiEventName: string): void{
    const event = new Event(uiEventName)
   // const event = document.createEvent('HTMLEvents');
   // event.initEvent(uiEventName, true, false);
    elem.dispatchEvent(event);
}
/**
 * 触发鼠标按键事件
 * @param elem 需要触发事件的DOM对象
 * @param mouseEventName 鼠标按键事件名
 */
export function fireKeyboardEvent(elem: HTMLElement,KeyboardEventName: string,params: KeyboardEventInit): void{
    if (elem){
       const event = new KeyboardEvent(KeyboardEventName,params);
        elem.dispatchEvent(event); 
    }
}
/**
 * 触发鼠标按键事件
 * @param elem 需要触发事件的DOM对象
 * @param mouseEventName 鼠标按键事件名
 */
 export function fireMoseEvent(elem: HTMLElement,mouseEventName: string): void{
    let event;
    if(window.MouseEvent) 
        event = new MouseEvent(mouseEventName);
    else
    {
        event = document.createEvent('MouseEvents');
        event.initEvent(mouseEventName, true, false);
    }
    elem.dispatchEvent(event);
}