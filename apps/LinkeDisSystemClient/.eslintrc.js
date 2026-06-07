module.exports = {
  root: true,
  env: {
    node: true
  },
  'extends': [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    '@vue/typescript/recommended'
  ],
  parserOptions: {
    ecmaVersion: 2020
  },
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-useless-escape': 'off',
    //"@typescript-eslint/no-inferrable-types": "off" // 关闭类型推断
    "@typescript-eslint/no-explicit-any": ["off"],//关闭any类型的警告
    "@typescript-eslint/no-use-before-define":0,//关闭代码顺序
    "camelcase": ["error", {"allow": ["aa_bb"]}]
  }
} 
