# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $menu = $("#ei_menu > ul")
  $menuItems = $menu.children("li")
  $menuItemsImgWrapper = $menuItems.children("a")
  $menuItemsPreview = $menuItemsImgWrapper.children(".ei_preview")
  totalMenuItems = $menuItems.length
  ExpandingMenu = (->    
    #
    #				@current
    #				set it to the index of the element you want to be opened by default,
    #				or -1 if you want the menu to be closed initially
    #			 
    current = -1    
    #
    #				@anim
    #				if we want the default opened item to animate initialy set this to true
    #			 
    anim = true    
    #
    #				checks if the current value is valid -
    #				between 0 and the number of items
    #			 
    validCurrent = ->
      current >= 0 and current < totalMenuItems
    init = ->      
      # show default item if current is set to a valid index 
      configureMenu()  if validCurrent()
      initEventsHandler()
    configureMenu = ->      
      # get the item for the current 
      $item = $menuItems.eq(current)      
      # if anim is true slide out the item 
      unless anim        
        # if not just show it 
        $item.css(width: "400px").find(".ei_image").css
          left: "0px"
          opacity: 1        
        # decrease the opacity of the others 
        $menuItems.not($item).children(".ei_preview").css opacity: 0.2
    initEventsHandler = ->      
      #
      #					when we click an item the following can happen:
      #					1) The item is already opened - close it!
      #					2) The item is closed - open it! (if another one is opened, close it!)
      #					
      $menuItemsImgWrapper.bind "click.ExpandingMenu", (e) ->
        $this = $(this).parent()
        idx = $this.index()
        if current is idx
          slideOutItem $menuItems.eq(current), false, 1500, "easeOutQuint", true
          current = -1
        else
          slideOutItem $menuItems.eq(current), false, 250, "jswing"  if validCurrent() and current isnt idx
          current = idx
          slideOutItem $this, true, 250, "jswing"
        false    
    # if you want to trigger the action to open a specific item 
    openItem = (idx) ->
      $menuItemsImgWrapper.eq(idx).click()    
    #
    #				opens or closes an item
    #				note that "mLeave" is just true when all the items close,
    #				in which case we want that all of them get opacity 1 again.
    #				"dir" tells us if we are opening or closing an item (true | false)
    #				
    slideOutItem = ($item, dir, speed, easing, mLeave) ->
      $ei_image = $item.find(".ei_image")
      itemParam = (if (dir) then width: "400px" else width: "75px")
      imageParam = (if (dir) then left: "0px" else left: "75px")      
      #
      #					if opening, we animate the opacity of all the elements to 0.1.
      #					this is to give focus on the opened item..
      #					
      if dir        
        #
        #						alternative:
        #						$menuItemsPreview.not($menuItemsPreview.eq(current))
        #										 .stop()
        #										 .animate({opacity:0.1}, 500);
        #				 
        $menuItemsPreview.stop().animate
          opacity: 0.1
        , 1000
      else if mLeave
        $menuItemsPreview.stop().animate
          opacity: 1
        , 1500      
      # the <li> expands or collapses 
      $item.stop().animate itemParam, speed, easing      
      # the image (color) slides in or out 
      $ei_image.stop().animate imageParam, speed, easing, ->        
        #
        #						if opening, we animate the opacity to 1,
        #						otherwise we reset it.
        #						
        if dir
          $ei_image.animate
            opacity: 1
          , 2000
        else
          $ei_image.css "opacity", 0.2
    init: init
    openItem: openItem
  )()  
  #
  #	call the init method of ExpandingMenu
  #	
  ExpandingMenu.init()  
  #
  #	if later on you want to open / close a specific item you could do it like so:
  ExpandingMenu.openItem 0 # toggles item 0 (zero-based indexing)
