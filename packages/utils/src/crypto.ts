export const utf8ToBase64 = (str: string): string => {
    return btoa(encodeURIComponent(str))
}

export const base64ToUtf8 = (base64: string): string => {
    if (!base64) return ''
    return decodeURIComponent(atob(base64))
}
