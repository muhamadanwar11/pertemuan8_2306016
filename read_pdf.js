const { PdfReader } = require('pdfreader');

new PdfReader().parseFileItems('C:/Users/Dell 5480/Documents/KULIAH/SEMESTER VI/PRAK MOBILE/1778635349Modul-8-Praktikum-Mobile.pdf', (err, item) => {
  if (err) console.error('error:', err);
  else if (!item) console.log('Done');
  else if (item.text) process.stdout.write(item.text + ' ');
});
