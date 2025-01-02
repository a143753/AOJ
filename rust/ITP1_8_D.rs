use std::io::BufRead;

fn f(s: &str, q: &str) -> bool {
    let ss = s.to_string() + s;

    let ls = ss.len();
    let lq = q.len();

    for i in 0..ls - lq {
        if &ss[i..i + lq] == q {
            return true;
        }
    }
    false
}

fn main() {
    let reader = std::io::stdin();
    let mut sq = Vec::<String>::new();

    reader.lock().lines().take(2).for_each(|line| {
        sq.push(line.unwrap());
    });

    let s = &sq[0];
    let q = &sq[1];

    let a = f(s, q);

    if a {
        println!("Yes");
    } else {
        println!("No");
    }
}
