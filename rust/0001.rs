fn read_input() -> Vec<i32> {
    (0..10)
        .map(|_| {
            let mut buf = String::new();
            std::io::stdin().read_line(&mut buf).ok();
            buf.trim().parse().expect("nan")
        })
        .collect()
}

fn main() {
    let mut a = read_input();
    a.sort_unstable_by(|a,b| b.cmp(a));
    a.iter().take(3).for_each(|x| println!("{}", x));
}

