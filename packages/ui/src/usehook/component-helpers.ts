import type { ComponentInternalInstance } from 'vue'

/**
 * 通用组件暴露类型
 */
export interface ComponentExposed {
  [key: string]: any
}

/**
 * 获取组件实例的 exposed 对象并进行类型推断
 *
 * @param instance - 组件实例
 * @returns 类型安全的 exposed 对象
 *
 * @example
 * ```typescript
 * const exposed = getExposed<ModalExposed>(parentInstance)
 * if (exposed) {
 *   exposed.close() // 完整的类型推断
 * }
 * ```
 */
export function getExposed<T extends ComponentExposed>(
  instance: ComponentInternalInstance | undefined
): T | undefined {
  const exposed = instance?.exposed
  if (!exposed) {
    return undefined
  }
  return exposed as T
}

/**
 * 类型守卫：检查 exposed 是否符合指定类型
 *
 * @param exposed - exposed 对象
 * @param keys - 必须包含的属性键
 * @returns 是否符合类型
 *
 * @example
 * ```typescript
 * if (hasExposed<ModalExposed>(parentInstance?.exposed, ['close', 'resultValue'])) {
 *   parentInstance.exposed.close() // 类型安全
 * }
 * ```
 */
export function hasExposed<T extends ComponentExposed>(
  exposed: unknown,
  keys: (keyof T)[]
): exposed is T {
  if (typeof exposed !== 'object' || exposed === null) {
    return false
  }
  // 确保 exposed 是对象类型，然后检查所有键是否存在
  const obj = exposed as Record<string, unknown>
  return keys.every(key => key in obj)
}
