zscrub
======

A complete, all-in-one, enterprise grade ZFS scrubbing solution.

But it's a 19 line shell script?
--------------------------------

Yes.

Example
-------

```shell
zfs set se.nym.zscrub:interval=28 zones # days
zscrub zones &
# That's it.
```

License
-------

MIT

