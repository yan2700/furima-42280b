const price = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      if (!isNaN(inputValue) && inputValue.trim() !== '') {
        const tax = Math.floor(inputValue * 0.1);// 利益（販売金額 - 販売手数料）
        const profitAmount = inputValue - tax;  // 手数料と利益を表示
        addTaxPrice.textContent = tax;
        profit.textContent = profitAmount;
      } else {
        addTaxPrice.textContent = 0;// 販売手数料（税額）を表示
        profit.textContent = 0;// 利益を表示
      }
    });
  }
};


window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);
