# NMA-3012-Final
NMA 3012 Final

Final Project Documentation

Artist Statement, Summary, and Inspiration:

This piece was inspired by the artist's fascination with the environment, specifically coastal and nighttime ones.

Viewers will notice that while waves are shown, the greater body of water itself is not. This was intentional because she wanted to make viewers feel as if they were sailing, swimming, or being sought out. This feeling of being sought out is emphasized by the lighthouse, as no boats are actually shown, almost as if the viewers are the ones being searched for.  

The artist focused on the transition of the lighthouse and the surrounding elements, because she wanted to show how the same area can look vastly different during different periods of the day. The sketch starts off as rather simple, but as more interaction is performed, stars and other aspects are revealed.

This ties into the nighttime atmosphere because it is around that time that perceptions and reality seem to warp. The artist added clouds for this reason to make viewers feel like they were floating or dreaming. She wanted them to, like in a dream, feel a sense of control as well as a sense of structurelessness. This sense is underscored when viewers try to add too many clouds, as they are unable to erase the clouds unless they restart the sketch or "wake up."

The artist herself has never been to an actual coast with a lighthouse, visiting such areas only in her sleep.

Controls: Move and press mouse to interact. Press 'r' for sound. Press #3 to continue.

About the Artist:

Lila Je is a Chinese American college student born and raised in Brooklyn. As an artist, she uses her work as a means of self-reflection and exploring the human experience. Her favorite hobbies include drawing, watching bad movies, and sleeping.

More Inspiration:

Peggy's Cove Lighthouse

http://www.visitingnovascotia.com/wp-content/uploads/2013/09/Peggys-Cove-Lighthouse-2115.jpg

Low Point Lighthouse

https://i1.wp.com/takemytrip.com/wp-content/uploads/2016/10/700x_16c_DSC02728_autoadj.jpg

Sambro Island Lighthouse

http://lighthousefriends.com/sambro1_2008.jpg

Video Games

https://i.pinimg.com/originals/ae/b3/39/aeb339348f20cf62a50380b4dd1c17f6.jpg

https://www.gamingnow.info/wp-content/uploads/2013/01/Zelda-Wind-Waker-HD-06.jpg

https://fitzysgametime.files.wordpress.com/2017/10/1611-2k_bioshock-the-collection_bio1_lighthouse-0.jpg?w=768

Open Processing

https://www.openprocessing.org/sketch/219297/

Research

Processing sound library

https://processing.org/reference/libraries/sound/index.html

Map();

https://processing.org/reference/map_.html

https://processing.org/examples/map.html

https://forum.processing.org/two/discussion/22471/how-does-mapping-function-work

https://stackoverflow.com/questions/17134839/how-does-the-map-function-in-processing-work

Loop();

https://processing.org/reference/loop_.html

https://processing.org/examples/loop.html

pushMatrix(); and popMatrix();

https://www.khanacademy.org/computer-programming/pushmatrixpopmatrix-processingjs/5505194477486080

Sine waves

https://processing.org/examples/sinewave.html

Process

I first started my project with the a sky blue background and the basics of the lighthouse, using vertices to create rectangle-like shapes that very subtly tapered upward. At first I started with one larger shape, but I after realizing I wanted color and the unique red/white of a lighthouse, I changed it to 3 basic shapes and additional triangles/rectangles to create the watch tower. I then created the rest of the background, like the moon and the land. However, I knew that I wanted to create a sense of time lapse so I made the background shift along with the movement of the mouse. That still seemed a bit basic, though, so I looked up some sketches on Open Processing for inspiration and decided to have some phases of the moon integrated. I used an ellipse and map(); to keep the ellipse at one y point so there would not be a random dark spot covering anything else but the moon.

At first the land was just manually placed ellipses, but after deciding I wanted to integrate stars as well to emphasize night time, I used my own functions drawScoop(); and drawStar();. I didn't necessarily want their placements to be completely random though, so it took some trial and error to place things where I wanted. After that, I added a light beacon to the lighthouse to even further underscore the screen transition.

Then, I knew I wanted to have clouds because I wanted rain physics to be integrated. While I did create the clouds as a class, though, I had a hard time finding examples in the fisica library of sketches I would want to use. Further, I did not understand how to manipulate these sketches even after some research. The fact that they were reliant on other functions in the library folder made it harder for me. Because of this, I added rectangles that acted as rain drops to the cloud class. I changed some of the colors of the rectangles to be random to add a slight bit of realism. But the rain only dropped once and left the cloud just floating on the screen, and I wanted a continual rain. Thankfully, I got help figuring out millis(); in class, but I was still unsatisfied with what I felt was a lack of interactivity.

Because of this, I wanted to add an audio portion. I had considered it before, but the rain without any noise solidified this determination. The noise library was a bit difficult to figure out, because, like the physics library (fisica), there were functions from other portions in the library in any given sketch. After some help from classmates, though, I managed to find one that worked for me. At first I tied the start of the noise to mousePressed();, but I realized that at mode 1, even if the sketch was not seen, the sound would start randomly, and I did not want that. So I ended up binding the sound to 'r.'

Finally, I wanted a semblance of physics in my sketch, so I ended up manipulating sine waves. I changed the colors and created multiple waves to create the shoreline. I also made theta change slightly when the mouse is pressed in response to rain clouds being created.

# Screenshots

![Alt text](/Je_Lila_Final/screenshots/shot1.png?raw=true "Screenshot 1 Title")

![Alt text](/Je_Lila_Final/screenshots/shot2.png?raw=true "Screenshot 2 Title")

![Alt text](/Je_Lila_Final/screenshots/shot3.png?raw=true "Screenshot 3 Title")

![Alt text](/Je_Lila_Final/screenshots/shot4.png?raw=true "Screenshot 4 Title")

![Alt text](/Je_Lila_Final/screenshots/shot5.png?raw=true "Screenshot 5 Title")

![Alt text](/Je_Lila_Final/screenshots/shot6.png?raw=true "Screenshot 6 Title")
