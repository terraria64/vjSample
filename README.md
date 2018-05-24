# vjSample

d.a.n.のコピーバンドのVJ素材
Touch OSCおよびオーディオ入力と連携


## VjPrgForTest.pde
メインクラス
キーボード操作・TouchOSCからの信号受信とパラメータ保持
描画するスケッチの切り替えを行うクラス


## AppBase.pde
抽象クラス
描画処理を行うスケッチはこのクラスを継承

## DanImg.pde
d.a.n.のロゴを描画
ノイズエフェクトをランダムで発生させる

## GraphVisualizer.pde
Line inのlevelに連動して変化する波形グラフを2種類、
同様にLine inのlevelに連動して直径が変化する円を描画するクラス
Gain固定のノイズ用波形グラフも同時に描画

inputのgainと円の色、各波形の透明度をTouchOSCから変更

## NowIts.pde
GraphVisualizer.pdeの背景色、グラフ色変更バージョン

## Pool.pde
三角形の枠の中をパーティクルが移動する
OpenProcessing上のサンプルプログラムを改変

## DotWave.pde
ランダムで色が変化するドットの波と、Line in の levelに合わせて線の太さが変わる円を描画

