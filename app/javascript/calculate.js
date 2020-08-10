function calculate() {
  const price = document.getElementById('item-price');
  const fee = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener('input', function() {
    let inputPrice = price.value;
    fee.innerHTML = `${inputPrice * 0.1}`;
    profit.innerHTML = `${inputPrice * 0.9}`;
  });
};

setInterval(calculate, 1000);