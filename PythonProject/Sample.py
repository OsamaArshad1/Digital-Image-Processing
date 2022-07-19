import cv2
from Model import *

def sample():


    # create a video capture object which is helpful to capture videos through webcam
    cam = cv2.VideoCapture(0, cv2.CAP_DSHOW)
    cam.set(3, 640)  # set video FrameWidth
    cam.set(4, 480)  # set video FrameHeight


    faceDetector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    eyeDetector = cv2.CascadeClassifier('haarcascade_eye.xml')

    face_id = 1

    print("Taking samples, look at camera ....... ")
    count = 0  # Initializing sampling face count

    while True:

        ret, img = cam.read()  # read the frames using the above created object
        # The function converts an input image from one color space to another
        converted_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = faceDetector.detectMultiScale(converted_image, 1.3, 5)

        for (x, y, w, h) in faces:

            # used to draw a rectangle on any image
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
            face_color = img[y:y+h, x:x+w]
            face_gray = img[y:y+h, x:x+w]
            eyes = eyeDetector.detectMultiScale(face_gray)
            for (ex, ey, ew, eh) in eyes:
                cv2.rectangle(face_color, (ex, ey), (ex+ew, ey+eh), (0, 255, 0), 2)
            count += 1

            cv2.imwrite("samples/face." + str(face_id) + '.' +
                        str(count) + ".jpg", converted_image[y:y+h, x:x+w])
            # To capture & Save images into the datasets folder

            cv2.imshow('image', img)  # Used to display an image in a window

        k = cv2.waitKey(100) & 0xff  # Waits for a pressed key
        if k == 27:  # Press 'ESC' to stop
            break
        elif count >= 10:  # Take 50 sample (More sample --> More accuracy)
            break
    model()
    print("Samples taken now closing the program....")
    cam.release()
    cv2.destroyAllWindows()
