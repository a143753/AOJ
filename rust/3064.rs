use std::io::BufRead;

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

fn f(v: Vec<i32>) -> String {
    let t1 = v[0];
    let t2 = v[1];
    let r1 = v[2];
    let r2 = v[3];

    let run;
    if t1 < t2 {
        run = "Alice";
    } else if t1 == t2 {
        run = "Draw";
    } else {
        run = "Bob";
    };

    if r1 == -1 || r2 == -1 {
        return run.to_string();
    } else if r1 == r2 {
        return "Draw".to_string();
    } else if r1 > r2 {
        return "Alice".to_string();
    } else {
        return "Bob".to_string();
    }
}

fn main() {
    let reader = std::io::stdin();

    let v = read_row_vec::<i32>(&mut reader.lock());

    let a = f(v);

    println!("{}", a);
}
