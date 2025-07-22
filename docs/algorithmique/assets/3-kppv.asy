
import math;

size(200); // Taille de l'image
add(grid(7,7,gray));

// triangles rouges
fill(shift((2,5))*scale(0.4)*polygon(3), red);
fill(shift((4,4))*scale(0.4)*polygon(3), red);
fill(shift((6,6))*scale(0.4)*polygon(3), red);

// carres bleus
fill(shift((4,1))*scale(0.4)*polygon(4), blue);
fill(shift((1,2))*scale(0.4)*polygon(4), blue);
fill(shift((3,5))*scale(0.4)*polygon(4), blue);

fill(shift((4,3))*scale(0.4)*polygon(5), green);

draw(circle((4,3),2.3), black + linewidth(2));
