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
fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let d = line.unwrap().parse::<T>().unwrap();
        col.push(d);
    });
    col
}

fn is_prime(n: i32) -> bool {
    if n < 2 {
        return false;
    } else if n == 2 {
        return true;
    } else if n % 2 == 0 {
        return false;
    } else {
        let nn = (n as f64).sqrt() as i32;
        let mut i = 3;
        while i <= nn {
            if n % i == 0 {
                return false;
            }
            i += 2;
        }
        return true;
    }
}

fn f(v: Vec<i32>) -> i32 {
    let mut n = 0;
    for x in v {
        if is_prime(x) {
            n += 1;
        }
    }
    n
}

fn main() {
    let reader = std::io::stdin();
    let n: i32 = read_scalar(&mut reader.lock());

    let v: Vec<i32> = read_col_vec(&mut reader.lock(), n as usize);

    let a = f(v.clone());

    println!("{}", a);
}
