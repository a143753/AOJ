use std::io::BufRead;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}

fn f(w: f64) -> f64 {
    let mut x = 15.0;
    loop {
        let y = (x - 30.0) * 2.0 * x * 6.0 * x;
        if y > (w + 50.0) * 1000.0 {
            break;
        }
        x += 1.0;
    }
    x
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let w: f64 = read_scalar(&mut reader);
    let a = f(w);
    println!("{} {} {}", 6.0 * a, 2.0 * a, a);
}
