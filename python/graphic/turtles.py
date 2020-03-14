import turtle

def method_name():
    speedy = turtle.Turtle()
    flippy = turtle.Turtle()
    speedy.pencolor("red")
    flippy.pencolor("blue")
    speedy.speed(0)
    flippy.speed(0)
    for i in range(180):
        speedy.forward(i + 50)
        speedy.left(92)
        flippy.forward(i + 50)
        flippy.right(92)
    turtle.done()

method_name()
