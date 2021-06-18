# wikibooks-haskell

This is simply me playing with the code as I go through the [WikiBooks Haskell documentation](https://en.wikibooks.org/wiki/Haskell).

Most of it is me floundering around.

Here are places you might be interested in:

## Weird

In [OtherDataStructure.hs](https://github.com/oldfartdeveloper/wikibooks-haskell/blob/main/IntermediateHaskell/OtherDataStructures.hs), a `Weird` data type without context is discussed.  I had a really hard time trying to visualize an arbitrary datatype w/ no reason to exist so I added a `Coin` datatype to help with that.

You can see it in action by firing up the Haskell repl (GHCi) and running the following:

| Command                                                      | Result  |
|--------------------------------------------------------------|---------|
| `weirdMap weirdFa1 weirdFb1 weirdSecond1`                    | **4**   |
| `weirdFold weirdFa1 weirdFb1 weirdFc1 weirdFd1 weirdThird1`  | **80**  |
| `weirdFold weirdFa1 weirdFb1 weirdFc1 weirdFd1 weirdFourth1` | **100** |

It really helped me.
