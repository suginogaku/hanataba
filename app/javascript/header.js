window.addEventListener('load', function(){
  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")


  pullDownButton.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})

// メニューの表示をクリックからホバーに改善
// window.addEventListener('load', function(){
//   // メニューアイコンのidの属性値
//   const pullDownButton = document.getElementById("lists")
//   // メニューのidの属性値
//   const pullDownParents = document.getElementById("pull-down")


//   pullDownButton.addEventListener('mouseover', function() {
//     pullDownParents.setAttribute("style", "display: block")
//   })
//   pullDownButton.addEventListener('mouseout', function(){
//     pullDownParents.removeAttribute("style", "display: none;")
//   })
// })
