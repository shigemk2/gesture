class GestureController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    long_press_recognizer     = UILongPressGestureRecognizer.alloc.initWithTarget(self, action:'longPressGestureRecognizer:')
    tap_gesture_recognizer    = UITapGestureRecognizer.alloc.initWithTarget(self, action:'tabGestureRecognizer:')
    rotate_gesture_recognizer = UIRotationGestureRecognizer.alloc.initWithTarget(self, action:'rotationGestureRecognizer:')
    swipe_gesture_recognizer  = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:'swipeGestureRecognizer:')
    pan_gesture_recognizer    = UIPanGestureRecognizer.alloc.initWithTarget(self, action:'panGestureRecognizer:')
    pinch_gesture_recognizer  = UIPinchGestureRecognizer.alloc.initWithTarget(self, action:'pinchGestureRecognizer:')

    self.view.addGestureRecognizer(long_press_recognizer)
    self.view.addGestureRecognizer(tap_gesture_recognizer)
    self.view.addGestureRecognizer(rotate_gesture_recognizer)
    self.view.addGestureRecognizer(swipe_gesture_recognizer)
    self.view.addGestureRecognizer(pan_gesture_recognizer)
    self.view.addGestureRecognizer(pinch_gesture_recognizer)
    view.accessibilityLabel = 'view 1'
    load_labels
  end

  def longPressGestureRecognizer(long_press_recognizer)
    show_alert("You've pressed the screen long enough!") if UIGestureRecognizerStateEnded == long_press_recognizer.state
  end

  def tabGestureRecognizer(tap_gesture_recognizer)
    show_alert("You've tapped the screen!")
  end

  def rotationGestureRecognizer(rotate_gesture_recognizer)
    show_alert("You've rotated the screen!") if UIGestureRecognizerStateEnded == rotate_gesture_recognizer.state
  end

  def swipeGestureRecognizer(swipe_gesture_recognizer)
    show_alert("You've just swiped!") if UIGestureRecognizerStateEnded == swipe_gesture_recognizer.state
  end

  def panGestureRecognizer(pan_gesture_recognizer)
    show_alert("You've Panned!") if UIGestureRecognizerStateEnded == pan_gesture_recognizer.state
  end

  def pinchGestureRecognizer(pinch_gesture_recognizer)
    show_alert("You've Pinched!") if UIGestureRecognizerStateEnded == pinch_gesture_recognizer.state
  end

  def load_labels
    label = UILabel.new
    label.frame = [[10,50],[300,100]]
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0
    label.text = "Try a different gesture such as tap, rotate, swipe, pan and pinch"
    view.addSubview(label)
  end

  def show_alert(message)
    @alert_box = UIAlertView.alloc.initWithTitle("Gesture Action",
                                                message:message,
                                                delegate:nil,
                                                cancelButtonTitle:"ok",
                                                otherButtonTitles:nil)

    @alert_box.show
  end
end
