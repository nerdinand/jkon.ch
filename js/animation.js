function showCircle(cx, cy, radius, color, zIndex) {
  let div = document.createElement('div');
  div.style.width = 0;
  div.style.height = 0;
  div.style.left = cx + 'px';
  div.style.top = cy + 'px';
  div.style.backgroundColor = color;
  div.style.zIndex = zIndex;

  div.className = 'circle';
  document.body.prepend(div);

  setTimeout(() => {
    div.style.width = radius * 2 + 'px';
    div.style.height = radius * 2 + 'px';
  }, 0);
}

function animate() {
  let viewPortWidth = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0);
  let viewPortHeight = Math.max(document.documentElement.clientHeight || 0, window.innerHeight || 0);
  let colors = [
    '#BFC4AC',
    '#F0C2C5',
    '#398DA0',
    '#CA4C2F'
  ];
  let sizeFactor = viewPortWidth / 20;

  for (var i = 0; i < 10; i++) {
    let xPosition = Math.floor((Math.random() * viewPortWidth) + 1);
    let yPosition = Math.floor((Math.random() * viewPortHeight) + 1);
    let color = colors[Math.floor(Math.random() * colors.length)];

    showCircle(xPosition, yPosition, i * sizeFactor, color, -i);
  }
}
