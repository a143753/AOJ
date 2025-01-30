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

fn main() {
    let reader = std::io::stdin();

    let n = read_scalar::<i32>(&mut reader.lock());
    let a = "ai1333".to_string() + "3".repeat((n / 100) as usize).as_str();
    println!("{}", a);
}
