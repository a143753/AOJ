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

fn log2(n: i32) -> i32 {
    let mut ret = 0;
    let mut x = 1;
    while x < n {
        x *= 2;
        ret += 1;
    }
    ret
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());

    println!("{}", n);
    println!("{:?}", log2(n) + 1);
}
