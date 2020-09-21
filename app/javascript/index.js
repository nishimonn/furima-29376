window.addEventListener("load", function(){
const selling_price = document.getElementById("item-price")
selling_price.addEventListener('input', function(){
  const price = document.getElementById("item-price").value
  const tax = price*0.1
  const sales_profit = price-tax
  const c = document.getElementById("add-tax-price")
  const d = document.getElementById("profit")
  c.textContent = tax
  d.textContent = sales_profit
  })
})
// ① JSを動かす記述 OK
// ② 価格を入力するHTMLのクラスかIDを変数Aに入れる OK
// ③ 上記で入れた変数Aに対しての発火条件を書く OK
// ④ ②の中で入力された値を取り出して変数Bに入れる OK
// ⑤ 変数Bに対して計算し変数C,Dに入れる（出品手数料Cと利益D）ok
// ⑥ 手数料部分には変数Cをインサート
// ⑦ 利益部分に変数Dをインサート
// ※出品手数料と利益はDBに保存等の処理はしないのでajaxを使わない（Ajaxappではなく普通のJavaScriptのカリキュラムを参考にしましょう