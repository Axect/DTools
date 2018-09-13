import std.stdio : writeln;

// import dtools.fp;
import fptools.fp;
import fptools.native;

void main() {
	mixin FP!long;

	Pipe p;
	p.input(seq(1,100));
	p.proc(
		map(x => 2 * x),
		takeWhile(x => x < 100),
		map(x => x / 2),
		take(40),
		drop(10),
		dropWhile(x => x <= 30),
		zipWith((x,y) => x + y, seq(1,10))
	);
	p.output.writeln;
}