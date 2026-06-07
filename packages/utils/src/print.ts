interface PrintOptions {
    noPrint?: string
}

interface PrintInterface {
    dom: HTMLElement | Element 
    options: PrintOptions
    init: () => void
    extend: <T extends object, U extends object>(obj: T, obj2: U) => T & U
    getStyle: () => string
    getHtml: () => string
    wrapperRefDom: (refDom: HTMLElement | Element) => HTMLElement | Element
    writeIframe: (content: string) => void
    toPrint: (frameWindow: Window) => void
    isInBody: (node: Node) => boolean
    isDOM: (obj: unknown) => obj is HTMLElement
}

const Print = function(dom: string | HTMLElement | { $el: HTMLElement }, options?: PrintOptions): PrintInterface {
    const instance: PrintInterface = {
        dom: null as unknown as HTMLElement,
        options: {
            noPrint: '.no-print'
        },

        init() {
            const content = this.getStyle() + this.getHtml()
            this.writeIframe(content)
        },

        extend<T extends object, U extends object>(obj: T, obj2: U): T & U {
            for (const k in obj2) {
                (obj as T & U)[k] = obj2[k] as (T & U)[typeof k]
            }
            return obj as T & U
        },

        getStyle(): string {
            let str = ""
            const styles = document.querySelectorAll('style,link')
            for (let i = 0; i < styles.length; i++) {
                str += styles[i].outerHTML
            }
            str += "<style>" + (this.options.noPrint ? this.options.noPrint : '.no-print') + "{display:none;}</style>"
            str += "<style>html,body{height: auto!important}table{font-size:40px;}</style>"
            return str
        },

        getHtml(): string {
            const inputs = document.querySelectorAll('input')
            const textareas = document.querySelectorAll('textarea')
            const selects = document.querySelectorAll('select')

            for (let k = 0; k < inputs.length; k++) {
                const input = inputs[k] as HTMLInputElement
                if (input.type === "checkbox" || input.type === "radio") {
                    if (input.checked) {
                        input.setAttribute('checked', "checked")
                    } else {
                        input.removeAttribute('checked')
                    }
                } else {
                    input.setAttribute('value', input.value)
                }
            }

            for (let k = 0; k < textareas.length; k++) {
                const textarea = textareas[k] as HTMLTextAreaElement
                textarea.innerHTML = textarea.value
            }

            for (let k = 0; k < selects.length; k++) {
                const select = selects[k] as HTMLSelectElement
                if (select.type === 'select-one') {
                    const children = select.children
                    for (let i = 0; i < children.length; i++) {
                        const child = children[i] as HTMLOptionElement
                        if (child.tagName === 'OPTION') {
                            if (child.selected) {
                                child.setAttribute('selected', "selected")
                            } else {
                                child.removeAttribute('selected')
                            }
                        }
                    }
                }
            }

            const outerHTML = this.wrapperRefDom(this.dom).outerHTML
            return outerHTML
        },

        wrapperRefDom(refDom: HTMLElement | Element): HTMLElement | Element {
            let prevDom: HTMLElement | Element | null = null
            let currDom: HTMLElement | Element | null = refDom
            return currDom
        },

        writeIframe(content: string): void {
            const iframe = document.createElement('iframe')
            const f = document.body.appendChild(iframe)
            iframe.id = "myIframe"
            iframe.setAttribute('style', 'position:absolute;width:0;height:0;top:-10px;left:-10px;')
            const w = f.contentWindow
            const doc = f.contentDocument || f.contentWindow?.document
            if (doc) {
                doc.open()
                doc.write(content)
                doc.close()
            }
            iframe.onload = () => {
                if (w) {
                    this.toPrint(w)
                }
                setTimeout(() => {
                    document.body.removeChild(iframe)
                }, 100)
            }
        },

        toPrint(frameWindow: Window): void {
            try {
                setTimeout(() => {
                    frameWindow.focus()
                    frameWindow.print()
                    frameWindow.close()
                }, 10)
            } catch (err) {
                console.log('err', err)
            }
        },

        isInBody(node: Node): boolean {
            return node === document.body ? false : document.body.contains(node)
        },

        isDOM(obj: unknown): obj is HTMLElement {
            if (typeof HTMLElement === 'object') {
                return obj instanceof HTMLElement
            }
            return obj !== null && typeof obj === 'object' && (obj as Node).nodeType === 1 && typeof (obj as Node).nodeName === 'string'
        }
    }

    instance.options = instance.extend({ noPrint: '.no-print' }, options || {})

    if (typeof dom === "string") {
        instance.dom = document.querySelector(dom) as HTMLElement
    } else {
        instance.dom = instance.isDOM(dom as HTMLElement) ? dom as HTMLElement : (dom as { $el: HTMLElement }).$el
    }

    instance.init()

    return instance
}

export { Print }
export default { Print }
