MigrationViewController
=======================

このライブラリはCoreDataのマイグレーションを円滑に行うためのものです。


## Installation

### CocoaPods

``` ruby
pod 'MigrationViewController'
```

## How to use

下記のようにすればマイグレーションが行われます。このライブラリはiOSの起動制限に配慮されています。マイグレーションによる起動時間制限で終了しません（たぶん）。
このライブラリによるマイグレーション中は何の表示もされません。実際に使用するときはMigrationViewControllerを継承して、何らかのマイグレーションであることの表示をするべきでしょう。

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MigrationViewController setUpWithWindow:self.window];
    
    return YES;
}
```

## 注意

このライブラリは、MagicalRecordを使用しています。もしMagicalRecordをインストールしたくない場合、下記のようにしてください。

* Coreのみをインストール

	``` ruby
	pod 'MigrationViewController/Core'
	```

* MigrationBaseViewControllerを継承したViewControllerを作成
* setupをオーバーライドしデータベースのセットアップコードを記述する

## License

MIT