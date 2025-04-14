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

fn f(mut n: i32) {
    while n >= 1 {
        println!("{}", n);
        n /= 2;
    }
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    let n: i32 = read_scalar(&mut reader);
    f(n);
}
