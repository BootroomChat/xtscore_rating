const playersList = ['FW', 'FWL', 'FWR', 'AML', 'AMR', 'ML', 'MR', 'AMC',
  'SS', 'WF', 'IF', 'C' +
  'M', 'LCM', 'DL', 'DR', 'DC', 'GK',
  'RCM', 'MC', 'DM', 'DMC', 'DML', 'DMR'];
let stage;
let thePitch;
let thePitchName;

function mousePos(e) {
  let x, y;
  e = e || window.event;
  return {
    x: e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft,
    y: e.clientY + document.body.scrollTop + document.documentElement.scrollTop
  };
}

function exportStage() {
  stage.draw();
  const uri = stage.toDataURL();
  const link = document.createElement("a");
  link.download = thePitch + " (" + thePitchName + ").png";
  link.href = uri;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  // noinspection JSAnnotator
  delete link;
}

let draw;
let realScale = 1;
$(function () {
  parseTpl("tpl_players", "players", {players: playersList});
  draw = Draw.createNew();

  setColor($('#colorInput').val());
  setLine($('#lineWidth').val());
  setFontSize($('#fontSize').val());
  setScale($('#scale').val());

  $(document).keydown(function (event) {
    if ((event.keyCode == 90 || event.keyCode == 122) && event.ctrlKey) {   //alt+z
      draw.undo();
    }
  });

  $('#textDialog').keydown(function (event) {
    if (event.keyCode == 13) {   //enter
      writeText();
      $('#textDialog').css('display', 'none');
    } else if (event.keyCode == 27) {   //esc
      $('#textDialog').css('display', 'none');
    }
  });
});

function showColorpick(obj) {
  $("#colorpickBtn").dropdown("toggle");
}

function zoomopen() {
  $('#zoomoutbtn').removeClass('btn-warning');
  $('#zoomoutbtn').addClass('btn-default');
  $('#zoomoutbtn').addClass('active');
  // $('#zoomoutbtn').attr('disabled', 'disabled');
  $('#zoomoutbtn').off('click', zoomopen);
  $('#zoomoutbtn').on('click', zoomclose);
  $('body').css('cursor', 'crosshair');
  draw.background.on('mousedown', function (event) {
    zoomout(event);
  });
}

function zoomclose() {
  $('#zoomoutbtn').removeClass('btn-default');
  $('#zoomoutbtn').addClass('btn-warning');
  $('#zoomoutbtn').removeClass('active');
  // $('#zoomoutbtn').attr('disabled', '');
  $('#zoomoutbtn').off('click', zoomclose);
  $('#zoomoutbtn').on('click', zoomopen);
  $('body').css('cursor', 'default');
  draw.background.off('mousedown');
  draw.background.on('mousedown', function (event) {
    draw.start(event);
  });
}

function zoomout(event) {
  draw.zoomout(event);
  // zoomclose();
}

function setPencil(type, name) {
  $('#pencil').children('a:first-child').html(name + '<span class="caret"></span>');
  return draw.setPencil(type);
}

function setColor(color) {
  $('#colorcardsample').css('background-color', color);
  $('#colorInput').val(color);
  $('#colorInput').blur();
  return draw.setColor(color);
}


function setLine(width) {
  $('#lineWidth').blur();
  return draw.setLine(width);
}

function setFont(font) {
  return draw.setFont(font);
}

function setFontSize(fontsize) {
  $('#fontSize').blur();
  return draw.setFontSize(fontsize);
}

function setScale(scale) {
  $('#scale').blur();
  return draw.setScale(scale);
}

// 开启文本输入框
function openTextInput(ev) {
  const x = ev.evt.clientX;
  const y = ev.evt.clientY + $(document).scrollTop();

  const stagePoint = stage.getPointerPosition();
  $('#textDialog').css('top', y + "px");
  $('#textDialog').css('left', x + "px");
  $('#text').val('');
  $('#textDialog').css('display', '');
  $('#text').attr('x', stagePoint.x);
  $('#text').attr('y', stagePoint.y);
  $('#text').focus();
}

function writeText() {
  const text = $('#text').val();
  const x = $('#text').attr('x');
  const y = $('#text').attr('y');
  draw.writeText({x: x, y: y}, text);
  $('#textDialog').css('display', 'none');
}

function initMap(name, mapname) {
  let url;
  thePitch = name;
  thePitchName = mapname;
  $('#mapPicker').html(mapname + '<span class="caret"></span>');
  $('#mapPicker').attr('data-map', name);

  $('#map').html('');
  const $tmp = $('<img />').addClass('hiddenmap');
  $('#map').append($tmp);
  url = "maps/" + name + ".png";
  var mapImg = {w: 0, h: 0};
  $(".hiddenmap").attr("src", url).on('load', function () {
    var s = this.width / this.height;
    mapImg.w = Math.min(1000, this.width);
    mapImg.h = mapImg.w / s;
    realScale = mapImg.w / this.width;
    // setScale($('#scale').val()*realScale);

    $('#map').css('width', mapImg.w);

    stage = new Konva.Stage({
      container: 'map',
      width: mapImg.w,
      height: mapImg.h
    });

    draw.stage = stage;
    var drawCanvas = new Konva.Layer();
    draw.canvas = drawCanvas;
    var drawBgcover = new Konva.Layer();
    draw.bgcover = drawBgcover;
    draw.bgimg = url;


    var layer = new Konva.Layer();
    layer.on('mousedown', function (event) {
      draw.start(event);
    });
    layer.on('mousemove', function (event) {
      draw.move(event);
    });
    layer.on('mouseup', function (event) {
      draw.end(event);
    });
    layer.on('dblclick', function (event) {
      openTextInput(event);
    });
    drawCanvas.on('mousedown', function (event) {
      draw.start(event);
    });
    drawCanvas.on('mousemove', function (event) {
      draw.move(event);
    });
    drawCanvas.on('mouseup', function (event) {
      draw.end(event);
    });
    drawCanvas.on('dblclick', function (event) {
      openTextInput(event);
    });
    // layer.on('mouseout', function(event){
    // 	draw.end(event);
    // });
    draw.background = layer;
    stage.add(layer);
    stage.add(drawBgcover);
    stage.add(drawCanvas);
    Konva.Image.fromURL(url, function (image) {
      image.setAttrs({
        width: mapImg.w,
        height: mapImg.h
      });
      layer.add(image);
      layer.draw();
    });
  });
}

function initPlayers() {
  for (var i = 0; i < playersList.length; i++) {
    var $li = $('<li></li>');
    var $img = $('<img />');
    $img.attr('src', 'players/' + playersList[i] + '.png');
    $li.append($img);
    $('#players').append($li);
  }
}

function enableDrag(jobj) {
  jobj.addClass('drag');
  jobj.removeClass('lock');
  jobj.attr('draggable', true);
}

function disableDrag(jobj) {
  jobj.addClass('lock');
  jobj.removeClass('drag');
  jobj.attr('draggable', false);
}

function drag(ev) {

}

function drop(ev) {
  ev.preventDefault();
  ev.stopPropagation();
}

function allowDrop(ev) {
  ev.preventDefault();
  ev.stopPropagation();
}

function dragEnd(ev) {
  // disableDrag($(ev.target));
  let x = ev.screenX - $('#map').offset().left - 15;
  let y = ev.screenY - $('#map').offset().top - 71 + $(document).scrollTop();
  // var pointer = stage.getPointerPosition();
  // var x = pointer.x;
  // var y = pointer.x;
  let layer = new Konva.Layer();
  let iconSet = {
    x: x,
    y: y,
    radius: 25,
    stroke: '#ff5656',
    'backgroundColor': '#ff5656',
    strokeWidth: 4,
    fillPatternRepeat: 'no-repeat',
    fillPatternScale: {
      x: 0.5,
      y: 0.5
    },
    fillPatternX: -25,
    fillPatternY: -25,
  };
  var circle = new Konva.Circle(iconSet);

  function __process() {
    circle.fillPatternImage(imageObj);

    var timer = null;
    circle.on('dblclick', function () {
      clearTimeout(timer);
      circle.destroy();
      stage.draw();
    });

    circle.on('click', function (ev) {
      clearTimeout(timer);
      timer = setTimeout(function () {
        switch (iconSet.stroke.toLowerCase()) {
          case '#ff5656':
            iconSet.stroke = '#31d1ff';
            break;
          case '#31d1ff':
            iconSet.stroke = '#ffffff';
            break;
          case '#ffffff':
            iconSet.stroke = '#ff5656';
            break;
          default:
            iconSet.stroke = '#ffffff';
            break;
        }
        circle.destroy();
        circle = new Konva.Circle(iconSet);
        __process();
        stage.draw();
      }, 300);
    });

    // add the shape to the layer
    layer.add(circle);
    layer.draggable(true);
    // add the layer to the stage
    stage.add(layer);
  }

  var imageObj = new Image();
  imageObj.onload = function () {
    __process();
  };
  imageObj.src = $(ev.target).attr('src');
}

function parseTpl(tplId, targetId, data) {
  var tpl = document.getElementById(tplId);
  if (tpl) {
    var html = juicer(tpl.innerHTML, data);
  } else {
    log("[Error]: template [#" + tplId + "] not existsed")
  }

  var dom = document.getElementById(targetId);
  if (dom) {
    dom.innerHTML = html;
  } else {
    log("[Error]: target DOM [#" + targetId + "] not existsed")
  }
}