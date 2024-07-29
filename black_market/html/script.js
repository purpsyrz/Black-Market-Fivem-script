window.addEventListener('message', function(event) {
    if (event.data.action === 'open') {
        document.getElementById('blackMarket').style.display = 'block';
        let itemList = document.getElementById('itemList');
        itemList.innerHTML = '';

        event.data.items.forEach(item => {
            let itemElement = document.createElement('div');
            itemElement.innerHTML = `
                <h2>${item.label}</h2>
                <p>Price: ${item.price} ${event.data.currency}</p>
                <button onclick="buyItem('${item.name}')">Buy</button>
            `;
            itemList.appendChild(itemElement);
        });
    }
});

document.getElementById('closeButton').addEventListener('click', function() {
    fetch('https://your-resource-url/close', { method: 'POST' });
    document.getElementById('blackMarket').style.display = 'none';
});

function buyItem(itemName) {
    fetch('https://your-resource-url/buyItem', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ itemName: itemName })
    }).then(() => {
        document.getElementById('blackMarket').style.display = 'none';
    });
}
