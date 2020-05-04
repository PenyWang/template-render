window.onload = function () {
  init();
}

function init () {
  render();
}

function render(){
  var tpl = document.getElementById('J_tpl').innerHTML,
      jsonData = document.getElementById('J_data').innerHTML,
      olist = document.getElementsByClassName('J_list')[0],
      data = JSON.parse(jsonData),
      len = data.length,
      items = '',
      item;
  
  for(var i = 0; i < len; i++) {
    item = data[i];
    items += setTplToHtml(tpl, {
      career: item.career,
      city: item.city,
      salary: item.salary,
      img: item.img
    });
  }

  olist.innerHTML = items;
}


function setTplToHtml(tpl, data) {
  return tpl.replace(new RegExp(/{{(.*?)}}/, 'gim'), function(node, key) {
    return data[key];
  })
}