# rat - lesser than cat
A more lightweight way to display file content. - Just for fun!

### Usage:
```
rat [filename]
```

## Dad jokes
The UNIX/Linux community is full of dads, and therefore, full of dad jokes. When I startes using Solaris in the '90's I learned about `less` being less than `more`. This kind of jokes did not end with commersial software. It was not about bored men at their desks at work. In the GNU world we have the GPL license without Copright, but with Copyleft. My final example is this actual file created with a *markup language* named "Markdown".
## Developers resisting development
What I find interesting and a bit amusing, is the resitance to development among developers. It souds a bit contradicting, but some developers seem to get upset when tools have more functionality than the bare POSIX requirements.
People also comment change of usage, like "Why do people output a single file with *cat*? That is the tool to concatenate multiple files!"
## The solution!
For these people I created a way to output a textfile! It is less than `more` and lesser than `less`. I called it `rat` since it is also less than `cat`. I also concidered naming it `dog` or simply `nocat`. It is just a few syscalls in assembly and it really only does one thing: it takes a file name as argument reads the file and outputs it to standard output (screen).

