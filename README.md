
# 📦 ActivityIndicatorManager

`ActivityIndicatorManager` 是一個簡潔易用的 iOS 單例工具，專為全螢幕 Loading Spinner 設計，能夠有效防止使用者操作、避免多重顯示，適用於登入、API 請求、資料同步等情境。

---

## ✨ 功能特色

- ✅ 全螢幕 `UIActivityIndicatorView`
- ✅ 自動加入半透明背景遮罩，阻擋點擊
- ✅ 使用 serial queue，確保執行緒安全
- ✅ 多場景支援（iOS 13+）
- ✅ 單例模式，呼叫簡潔直覺

---

## 🧪 使用方式

```swift
// 顯示 Loading
ActivityIndicatorManager.shared.start()

// 結束 Loading
ActivityIndicatorManager.shared.stop()
