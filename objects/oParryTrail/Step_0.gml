life--;
progress += 0.18;   // swipe speed
alpha -= 0.12;

if (life <= 0)
{
    instance_destroy();
}