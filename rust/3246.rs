use std::collections::HashMap;
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

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

fn f(h: &HashMap<i32, i32>) -> i32 {
    let mut max = 0;
    let mut myr = 0;

    let mut k = h.keys().collect::<Vec<&i32>>();
    k.sort();

    k.iter().for_each(|k0| {
        if h[k0] > max {
            max = h[k0];
            myr = **k0;
        }
    });
    myr
}

fn main() {
    let stdin = std::io::stdin();
    let mut reader = stdin.lock();

    loop {
        let n: i32 = read_scalar(&mut reader);
        if n == 0 {
            break;
        } else {
            let mut g = HashMap::new();
            let mut m = HashMap::new();
            for _ in 0..n {
                let l = read_line_words(&mut reader);
                let y = l[0].parse::<i32>().unwrap();

                if l[2] == "Gold" {
                    *g.entry(y).or_insert(0) += 1;
                }
                *m.entry(y).or_insert(0) += 1;
            }

            println!("{} {}", f(&g), f(&m));
        }
    }
}
