
Mixing together

<img src="https://raw.githubusercontent.com/nvzqz/FileKit/assets/banner.png"/>
and

<img src="https://user-images.githubusercontent.com/1577319/27564151-1d99e3a0-5ad6-11e7-8ab6-417c5b5a3ff2.png"/>


```swift
let source: Path = "/path/to/file"
source.zip(to: "/path/to/zipfile")
```

```swift
let zip: Path = "/path/to/zipfile"
zip.archive(mode: .read)
...
```
