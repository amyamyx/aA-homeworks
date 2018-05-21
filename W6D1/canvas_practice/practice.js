document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');
  canvas.height = 500;
  canvas.width = 500;

  ctx.fillStyle = 'tomato';
  ctx.fillRect(50, 50, 80, 50);

  const canvas2 = document.getElementById('mycanvas2');
  const ctx2 = canvas2.getContext('2d');

  ctx2.beginPath();
  ctx2.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx2.strokeStyle = 'blue';
  ctx2.lineWidth = 3;
  ctx2.stroke();
  ctx2.fillStyle = "PeachPuff";
  ctx2.fill();

  const canvas3 = document.getElementById('mycanvas3');
  const ctx3 = canvas3.getContext('2d');

  ctx3.beginPath();
  ctx3.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx3.strokeStyle = 'green';
  ctx3.lineWidth = 2;
  ctx3.moveTo(45, 65);
  ctx3.lineTo(65, 65);
  ctx3.moveTo(85, 65);
  ctx3.lineTo(105, 65);
  ctx3.moveTo(75, 75);
  ctx3.lineTo(70, 80);
  ctx3.lineTo(75, 85);
  ctx3.strokeRect(45, 90, 60, 20);
  ctx3.moveTo(45, 100);
  ctx3.lineTo(105, 100);
  ctx3.moveTo(60, 90);
  ctx3.lineTo(60, 110);
  ctx3.moveTo(75, 90);
  ctx3.lineTo(75, 110);
  ctx3.moveTo(90, 90);
  ctx3.lineTo(90, 110);
  ctx3.stroke();

});
