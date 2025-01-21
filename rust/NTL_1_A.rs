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

fn f(n0: i32) -> Vec<i32> {
    let mut a = Vec::new();
    let mut n = n0;

    loop {
        if n % 2 == 0 {
            n = n / 2;
            a.push(2);
        } else {
            break;
        }
    }

    let mut k = 3;
    loop {
        if n == 1 {
            break;
        } else if n % k == 0 {
            n = n / k;
            a.push(k);
        } else {
            k += 2;
        }
    }
    a
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());

    let a = f(n);

    println!(
        "{}: {}",
        n,
        a.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(" ")
    );
}
