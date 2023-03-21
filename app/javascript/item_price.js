function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1); //"入力した金額をもとに販売手数料を計算する処理"
  
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1)); //"販売利益の計算"
})
};
window.addEventListener('load', count);