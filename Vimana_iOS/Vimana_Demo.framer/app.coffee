# Import file "poc_1_new" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/poc_1_new@2x")

ViewController = require "ViewController"

pages = new PageComponent
    width: Screen.width
    height: Screen.height
    backgroundColor: null
    scrollVertical: false

pages.addPage sketch.$002_Analytics_Connection_Usage_001
pages.addPage sketch.$003_Analytics_Data_Usage_001
pages.addPage sketch.$004_Analytics_Parental_001
pages.addPage sketch.$004_Analytics_Search_001

vc = new ViewController initialView:sketch.$001_Analytics_Dashboard_001

sketch.Group_8_Copy_4.onClick -> 
	pages.snapToPage(sketch.$002_Analytics_Connection_Usage_001, animate=false)
	vc.slideIn(pages)

sketch.Group_8.onClick -> 
	pages.snapToPage(sketch.$003_Analytics_Data_Usage_001, animate=false)
	vc.slideIn(pages)

sketch.Group_8_Copy.onClick -> 
	pages.snapToPage(sketch.$004_Analytics_Parental_001, animate=false)
	vc.slideIn(pages)

sketch.Group_8_Copy_2.onClick -> 
	pages.snapToPage(sketch.$004_Analytics_Search_001, animate=false)
	vc.slideIn(pages)

sketch.Group_16.onClick -> vc.back()

sketch.Group_20.onClick -> vc.back()

sketch.Group_93.onClick -> vc.back()

sketch.Group_35.onClick -> vc.back()

sketch.Group_513.onClick -> vc.back()
		 

