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

fn f(n: i64) -> i64 {
    let mut ans = 1;
    for i in 1..=n {
        ans *= i;
    }
    ans
}

fn main() {
    let reader = std::io::stdin();
    let n: i64 = read_scalar(&mut reader.lock());
    let ans = f(n);
    println!("{}", ans);
}
