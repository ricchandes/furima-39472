  
window.addEventListener('load', () => {        //まずはウィンドウズでページをロードしたときに以下のコードが読まれる
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {      //これで入力があるたびにイベントが起こる
    const inputValue        = priceInput.value;     //これで入力した金額の値を取得
    const taxPrice          = Math.floor(inputValue*0.1)
    const addTaxDom         = document.getElementById("add-tax-price");
    addTaxDom.innerHTML     = `${taxPrice}`;
    const Profit            = document.getElementById("profit");
    Profit.innerHTML        = `${inputValue - taxPrice}`
  })
});