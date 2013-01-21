# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$description_width = "40%"
$preview_width = "75px"
$ ->
  $menu = $("#ei_menu > ul")
  $menuItems = $menu.children("li")
  $menuItemsImgWrapper = $menuItems.children("a")
  $menuItemsPreview = $menuItemsImgWrapper.children(".ei_preview")
  totalMenuItems = $menuItems.length
  ExpandingMenu = (-> 
    current = -1 # default open element, -1 if none
    anim = true # initially animate default open item
    validCurrent = ->
      current >= 0 and current < totalMenuItems # check if value is valid
    init = ->  
      configureMenu()  if validCurrent()
      initEventsHandler()
    configureMenu = ->      
      # get the item for the current 
      $item = $menuItems.eq(current)      
      # if anim is true slide out the item 
      unless anim        
        # if not just show it 
        $item.css(width: $description_width).find(".ei_image").css
          left: 0
          opacity: 1        
        # decrease the opacity of the others 
        $menuItems.not($item).children(".ei_preview").css opacity: 0.2
    initEventsHandler = ->  
      $menuItemsImgWrapper.bind "click.ExpandingMenu", (e) ->
        $this = $(this).parent()
        idx = $this.index()
        if current is idx
          slideOutItem $menuItems.eq(current), false, 1500, "easeOutQuint", true
          current = -1 # if this is open, close it
        else
          slideOutItem $menuItems.eq(current), false, 250, "jswing"  if validCurrent() and current isnt idx
          current = idx
          slideOutItem $this, true, 250, "jswing" # if another is open, close it, and open this
        false    
    # if you want to trigger the action to open a specific item 
    openItem = (idx) ->
      $menuItemsImgWrapper.eq(idx).click()
    # opens or closes an item
    slideOutItem = ($item, opening, speed, easing, mLeave) ->
      $ei_image = $item.find(".ei_image")
      itemParam = (if (opening) then width: $description_width else width: $preview_width)
      imageParam = (if (opening) then left: 0 else left: $preview_width)
      if opening	
        # alternative: $menuItemsPreview.not($menuItemsPreview.eq(current)).stop().animate({opacity:0.1}, 500);
        $menuItemsPreview.stop().animate
          opacity: 0.1, 1000
      else if mLeave # true when all items close
        $menuItemsPreview.stop().animate
          opacity: 1, 1500      
      # the <li> expands or collapses 
      $item.stop().animate itemParam, speed, easing      
      # the image (color) slides in or out 
      $ei_image.stop().animate imageParam, speed, easing, -> 
        if opening
          $ei_image.animate
            opacity: 1, 2000
        else
          $ei_image.css "opacity", 0.2
    init: init
    openItem: openItem
  )()
  
  ExpandingMenu.init() # Initialize the menu
  ExpandingMenu.openItem 0
