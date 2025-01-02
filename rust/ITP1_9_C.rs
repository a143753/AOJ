use std::io::BufRead;

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

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

fn f(v1: &str, v2: &str) -> i32 {
    if v1 > v2 {
        return 1;
    } else if v1 < v2 {
        return -1;
    } else {
        return 0;
    }
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());

    let mut taro = 0;
    let mut hanako = 0;

    for _ in 0..n {
        let ws = read_line_words(&mut reader.lock());
        let w1 = &ws[0];
        let w2 = &ws[1];

        match f(&w1, &w2) {
            1 => taro += 3,
            -1 => hanako += 3,
            _ => {
                taro += 1;
                hanako += 1;
            }
        }
    }
    println!("{} {}", taro, hanako);
}
