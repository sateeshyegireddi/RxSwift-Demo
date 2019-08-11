//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by Sateesh Yegireddi on 13/06/19.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//https://medium.com/ios-os-x-development/learn-and-master-%EF%B8%8F-the-basics-of-rxswift-in-10-minutes-818ea6e0a05b

        let disposeBag = DisposeBag()
        
        //MARK: - Observable, Subscrptions -
        
        /*
        let sequence = Observable.just("Hi RxSwift")
        let sequence = Observable.from([1, 2, 3])
        
        let subscription = sequence.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //MARK: - Subjects -
        /*
        let publishSubject = PublishSubject<String>()
        
        publishSubject.onNext("Hello")
        publishSubject.onNext("World")
        
        let subscription = publishSubject.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        publishSubject.onNext("Welcome")
        publishSubject.onNext("RxSwift")
        */
        
        /*
        let subject = BehaviorSubject<String>(value: "")
        
        subject.onNext("Hello")
        subject.onNext("World")

        let subscription = subject.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        subject.onNext("Welcome")
        subject.onNext("RxSwift")
        */
        
        /*
        let subject = ReplaySubject<String>.create(bufferSize: 3)
        
        subject.onNext("Hello")
        subject.onNext("World")
        subject.onNext("Hola")
        subject.onNext("Mundo")

        let subscription = subject.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        subject.onNext("Welcome")
        subject.onNext("RxSwift")
        */
        
        /*
        let variable = Variable<String>("")
        
        variable.value = "Hello"
        variable.value = "World"
        
        let value = variable.value
        print(value)

//        variable.value = "RxSwift"
//        print(variable.value)
        
        let subscription = variable.asObservable().subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        variable.value = "Hello"
        variable.value = "RxSwift"
 
        */
        
        //MARK: - Transformations -
        
        //Map - Modify sequence.
        
        /*
        let sequence = Observable.from([1, 2, 3, 4, 5])
        
        let subscription = sequence.map { $0 * 10 }.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //FlatMap - Used to merge two sequences.
        
        /*
        let sequence_1 = Observable.from([1, 2])
        let sequence_2 = Observable.from([3, 4])

        let sequenceOfSequences = Observable.of(sequence_1, sequence_2)
        
        let subscription = sequenceOfSequences.flatMap { return $0 }.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //Scan - Aggregate values like Reduce in Swift.
        
        /*
        let sequence = Observable.from([1, 2, 3, 4, 5])

//        sequence.scan(0) { (seed, value) in
//            return seed + value
//        }
        
        let subscription = sequence.scan(0) { $0 + $1 }.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //Buffer - Emit buffered collection of items.
        
        //TODO: Understand it soon..!!
//        let sequence = Observable.from([1, 2, 3, 4, 5])
//
//        sequence.buffer(timeSpan: 100, count: 3, scheduler: )
        
        //MARK: - Filter -
        
        //Filter - filter items.
        
        /*
        let sequence = Observable.from([1, 2, 3, 4, 5])
        
        let subscription = sequence.filter { $0 % 2 == 0 }.subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //DistinctUntilChanged - Emit common values only if they are exist serially along with other.
        
        /*
        let sequence = Observable.from([1, 1, 2, 2, 2, 3, 4, 5, 3]) // [1(1, 1), 2(2, 2, 2), 3, 4, 5, 3]
        
        //let sequence = Observable.from([1, 2, 2, 1, 4, 5, 3]) // [1, 2(2, 2), 1, 4, 5, 3]

        let subscription = sequence.distinctUntilChanged().subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //Debounce - The original function be called after the caller stops calling the decorated function after a specified period.
        
        /*
        let button = UIButton()
        let subscription = button.rx.tap.asDriver().debounce(2).drive(onNext: { _ in
            print("Tap..!!")
        })
        */
        
        //After button press, Tap..!! gets printed after 2 seconds unless it gets pressed again.
        //Press... Press...
        //2 seconds over after button has been pressed. Tap..!!
        
        //Throttle - The original function be called at most once per specified period.
        
        /*
        let button = UIButton()
        let subscription = button.rx.tap.asDriver().throttle(2).drive(onNext: { _ in
            print("Tap..!!")
        })
        */
        
        //No matter how many times the button gets pressed, it only prints after 2 seconds only.
        //Press... Press... Press... Press... Press... Press... Press... Press...
        //Tap..!! 2 seconds over but still button is being pressed. Tap..!!
        
        //TakeDuration -
        
        //Skip -
        
        //MARK: - Combine -
        
        //startWith - Add items at the beginning of a sequence.
        
        /*
        let sequence = Observable.from([3, 4, 5])
        
        let subscription = sequence.startWith(1, 2).subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //Merge - Combine multiple observables into a single sequence.
        
        /*
        let subject_1 = PublishSubject<Int>()
        let subject_2 = PublishSubject<Int>()
        
        let sequence = Observable.of(subject_1, subject_2)
        
        let subscription = sequence.merge().subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        subject_1.onNext(2)
        subject_1.onNext(3)
        subject_2.onNext(5)
        subject_1.onNext(4)
        subject_2.onNext(6)
        */
        
        //Zip - combine two sequences by first element of first sequence with first element of second one.
        
        /*
        let sequence_1 = Observable.from([1, 2])
        let sequence_2 = Observable.from(["Hello", "Rx Swift"])
        
        let subscription = Observable.zip(sequence_1, sequence_2).subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //Concat - Same as merge.
        
        //CombineLatest - 
        
        /*
        let sequence_1 = PublishSubject<String>()
        let sequence_2 = PublishSubject<String>()

        let observable = Observable.combineLatest(sequence_1, sequence_2) { (left, right) in
            "\(left) \(right)"
        }
        
        let subscription = observable.subscribe(onNext: { (string) in
            print(string)
        })
        
        sequence_1.onNext("Hello,")
        sequence_2.onNext("world")
        sequence_2.onNext("RxSwift")
        sequence_1.onNext("Have a good day,")
        */
        
        /*
        let sequence_1 = Observable.from([1, 2, 3])
        let sequence_2 = Observable.from([4, 5])

        let subscription = Observable.combineLatest(sequence_1, sequence_2).subscribe { (event) in
            switch event {
            case .next(let value):
                print("value: \(value)")
            case .completed:
                print("Completed")
            case .error(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        */
        
        //SwitchLatest - Used to switch over observable sequences and emit the items from current observable sequence.
        
        /*
        let subject_1 = PublishSubject<String>()
        let subject_2 = PublishSubject<String>()
        let subject_3 = PublishSubject<String>()

        let source = PublishSubject<Observable<String>>()
        
        let observable = source.switchLatest()
        
        let subscription = observable.subscribe(onNext: { (string) in
            print(string)
        })
        
        source.onNext(subject_1)
        subject_1.onNext("Some text sequence from subject 1")
        subject_2.onNext("Some text sequence from subject 2")

        source.onNext(subject_2)
        subject_2.onNext("More text sequence from subject 2")
        subject_1.onNext("and also from subject 1")

        source.onNext(subject_3)
        subject_2.onNext("why don't you see me?")
        subject_1.onNext("I'm alone. Help me!")
        subject_3.onNext("Hey! It's subject 3. I win.")
        
        source.onNext(subject_1)
        subject_1.onNext("I'm subject 1! Super one!")
        
        */
        //MARK: - Stop observing sequence -
        
        //subscription.disposed(by: disposeBag)
    }


}
