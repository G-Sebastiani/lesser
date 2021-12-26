# lesser (a.k.a. noCat?)
A more light weight way to display file content. - Just for fun!

### Usage:
```
lesser [filename]
```

## Dad jokes
The UNIX/Linux community is full of dads, and therefore, full of dad jokes. When I startes using Solaris in the '90's I learned about `less` being less than `more`. This kind of jokes did not end with commersial software. It was not about bored men at their desks at work. In the GNU world we have the GPL license without Copright, but with Copyleft. My final example is this actual file created with a *markup language* named "Mark down".
## Developers resisting development
What I find interesting and a bit amusing, is the resitance to development among developers. It souds a bit contradicting, but comments like "Why do people output a single file with *cat*, that is the tool to concatenate?" Some developers seem to get upset when tools have more functionality than the bare POSIX requirements.
## The solution!
For these people I created a way to output a textfile! It is less than `more` and less (and lesser) than `less`. I called it `lesser`. It is also less than `cat`, so I also concidered naming it `dog`, `rat` or simply `nocat`. It is just a few syscalls in assembly and it really only does one thing: it takes a file name as argument reads the file and outputs it to standard output (screen).
