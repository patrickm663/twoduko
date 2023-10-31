# twoduko
TwoDuko is a two player Suduko-like game where players take turns playing moves in a grid that follows the Suduko ruleset.

This version is a CLI implementation. **Further work is required to pretty-print the grid and have it adapt correctly to nxm boards.**

## How to Install
To build and run from source:

1. Ensure D and [Dub](https://dub.pm/getting_started.html) is installed
2. Clone and enter the repo
3. Build using Dub 
```
dub build
```

Alternatively, 
```
dub build --build=release
```

4. Run the binary executable

```
./twoduko
```

Alternatively, the game can be played via a Docker container.

1. Build the container image
```
docker build -t twoduko .
```

2. Run the container
```
docker run -ti --rm twoduko:latest
```

## Rules
TwoDuko is played on an empty 4x4 grid. Players take turns playing numbers between 1-4 into the grid. A move is considered legal if there are no repetitions in the horizontal, vertical, or 2x2 subgrid.

![image](https://github.com/patrickm663/twoduko/assets/77886027/c39d436d-9ce8-43bb-841f-45a9022c55fd)

Players win when their opponent cannot make a legal move, or there are no empty spaces remaining.

## TODO
- [ ] Pretty-print the gameboard
- [x] Add a Dockerfile so Dub isn't a requirement
- [ ] Colour-code player moves to make it easier to track
- [ ] Update the board printout logic to support nxm grids
- [ ] Begin work on an 'AI' that doesn't just make random moves
- [ ] Compile to WASM and create a web frontend
- [ ] Add the option to play another human and select who starts first
- [ ] Add some unit tests

## License
MIT.

## Acknowledgements
This project was originally issued as part of Stellenbosch University's Computer Science 114 semester project I had in 2017. We wrote this in Java and it always stuck out for me as a point where I fell in love with programming. I rewrote this game so many times whenever we would learn something new -- I couldn't wait to get back home and add something new to the project or rewrite it.

I wanted to rewrite a baseline version in D over a couple evenings because it is a good launchpad for other interesting topics like WASM, AIs, and networking.
