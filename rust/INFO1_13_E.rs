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

fn f(v: Vec<i32>) {
    print!("(");
    print!(
        "{}",
        v.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(", ")
    );
    print!(")");
    println!();
}

fn g(n: i32) -> Vec<i32> {
    (0..n).collect()
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());

    let v = g(n);

    f(v);
}
