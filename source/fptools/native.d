module fptools.native;

/++
    take - Usage : take(3, [1,2,3,4,5]) == [1,2,3]
+/
T[] take(T) (int n, T[] list) {
    return list[0 .. n];
}

/++
    takeWhile - Usage : takeWhile!int(x => x < 3, seq(1,10)) == [1,2]
+/
T[] takeWhile(T) (bool delegate(T) p, T[] list) {
    auto n = 0;
    T[] result;
    while(p(list[n])) {
        result ~= list[n];
        n++;
    }
    return result;
}

/++
    map - Usage : map!int(x => x + 3, seq(1,4)) == [4, 5, 6, 7]
+/
T[] map(T) (T delegate(T) f, T[] list) {
    T[] result; result.length = list.length;
    foreach(i, ref x; list) {
        result[i] = f(x);
    }
    return result;
}

/++
    drop - Usage : drop(3, seq(1,5)) == [4,5]
+/
T[] drop(T) (int n, T[] list) {
    assert(n <= list.length, "Exceed drop range");
    return list[n .. $];
}

/++
    dropWhile - Usage : dropWhile!int(x => x < 3, seq(1,5)) == [3,4,5]
+/
T[] dropWhile(T) (bool delegate(T) p, T[] list) {
    auto n = 0;
    while(p(list[n])) {
        n++;
    }
    return list[n .. $];
}

/++
    reduce
+/
T reduce(T) (T delegate(T, T) op, T[] list) {
    T result = list[0];
    foreach(i; 1 .. list.length) {
        result = op(result, list[i]); 
    }
    return result;
}