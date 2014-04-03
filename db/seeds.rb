# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user = User.create(email: 'gerson@example.com', password: 'josh1234', roles: 'admin')
user.profile = Profile.create(name: "gerson", birthdate: "19/07/1989", gender: "male", address: "kdjasldjaskjd", country: "Brazil" )
user.save!

Level.destroy_all

#adding for testing, a new seed file need to be created for production.
(1..10).to_a.each do |d|
  Level.create(:name => "level_#{d}", :seq_number => d)
end

level1 = Level.first
level2 = Level.last
level3 = Level.all[2]

topic1 = Topic.create(title: 'Basics', seq_number: '1', level_id: level1.id)
topic1.save!
content1 = Content.create(title: 'Introduction', transcript: ' Friends - Your visit to this site itself proves that you are eager to start your journey towards becoming techno-savvy.

And believe us, we need this enthusiasm only, the rest you leave it to us - we will try our best to make this journey as smooth as possible - TOGETHER WE CAN DO IT.

Your navigation in this site till this point also indicates that you want to start from the basic level.
So lets start.

Let me start with a simple question - which gadget today has taken over every single industry? - may it be a small scale or big scale industry - which gadget do you see being used everywhere you go? - may it be a Ticket booking kiosk, a Space Research Center or the smallest Shopping mall...

I am sure you all know the answer - even a primary school going kid today knows about it - its Computer.

Computer today has become an inevitable part of our life...this single gadget has changed the definition of literacy that if you don’t know Computer - you are illiterate.

Let us try to understand what this computer is and the technicalities involved in it.

In literal terms - Computer is an electronic device which takes the input, stores it in memory - processes it and then produces the output.

Friends - remember this definition very well as we will need to refer it many a times throughout this journey.

Remember - our entire journey - from basics till advanced - is going to revolve around this gadget called COMPUTER.

Hence the more we become friendly with it, the easier our journey will be.

Now lets try to understand what language this Computer understands because we need to communicate with this friend of ours.

And here is the answer - This friend of ours understands only 0s and 1s. In electronic terminology, it only understands ON and OFF state. This language of 0s and 1s is called Binary Language.

You must be thinking that how can we learn or make a friendship with a gadget which only understands the language of 0s and 1s. But do not worry at all - one of the topics in our Journey ahead - called Programming Language - is going to play the role of mediator between ourselves and Computer to easily convey our messages to it.

As of now just remember that Computer understands the language of 0s and 1s (On and Off State).

Now we will try to understand what are the major components which make this Computer as a whole?

Again recall the definition of Computer - Computer is an electronic device which takes the input which can be data or instructions, stores it in memory - processes it and then produces the output.

There are 3 main things - taking the input, storing it in memory & processing it and then last is producing the output.

First aspect is taking the input - this is taken care by the Input Unit - one of the components of Computer.

This unit contains devices with the help of which we enter data into computer or give instructions to Computer. This unit makes link between user and computer.
Some of the input devices are keyboard and mouse. 

Second aspect is storing the input in memory & processing it - this is taken care by the Central Processing Unit (also called CPU). CPU is considered as the brain of the computer. CPU performs all types of data processing operations. It stores data , intermediate results and instructions(program).It controls the operation of all parts of computer.

And the third aspect is producing the output - this is taken care by the output unit - Output unit consists of devices with the help of which we get the information from computer. This unit is a link between computer and users.
Some of the Output devices are Monitor and Printer.', summary: 'In this section, you will learn about -
a) What Computer is
b) Input Devices
c) Output Devices', youtube_channel_url: 'http://youtu.be/MG_SxId9Wuw', topic_id: topic1.id)
content1.save(:validate => false)

topic2 = Topic.create(title: 'Software and Hardware', seq_number: '2', level_id: level1.id)
topic2.save!
content2 = Content.create(title: 'Software and Hardware', transcript: 'Hardware
The word hardware refers to the physical components that make your computer such as CPU, mouse, keyboard, monitor etc.



Software
To tell you frankly - Hardware has no value without software. It is a set of instructions that make hardware/computer function.

Mainly there are two types of Software - Application Software and System Software.

System software is software that runs & controls the hardware units of the system. To tell you the fact - Application software cannot run without System Software. Application software is specifically written to create applications for users according to their requirement and they run on system software.

To give the example - When you listen to the audio in your computer, there must be a program behind it which makes it possible to produce the sound. This is example of system software and called Sound Driver. And Microsoft Office, Programming Languages and Databases can be considered as Application software.

One of the best examples of System Software is Operating System. Operating System is the heart of your computer. Computer at many a times is also referred as a system. So Operating System enables you to operate the System. Without Operating System, your computer is simply a body without soul in it.

Microsoft Windows, Unix, Mac are some of the examples of operating system though Windows is most widely used Operating System.', summary: 'n this section, you will learn about -
a) What is Hardware
b) What is Software
c) Application Software & System Software', youtube_channel_url: 'http://youtu.be/-iZ5QJDa7Tg', topic_id: topic2.id)
content2.save(:validate => false)

topic3 = Topic.create(title: 'Memory', seq_number: '3', level_id: level1.id)
topic3.save!
content3 = Content.create(title: 'Memory', transcript: 'Do you remember we have referred a word "Memory" many a times throughout our discussion so far?

Yes Friends - the way we human beings have memory - computer too has a memory. Now stretch your brain a bit to think what is the significance of memory in our case? And then try to relate it to the Memory of a computer. If you have understood the discussion so far, you will definitely agree that human memory and Computer memory resembles to quite an extent.

Tell us how?

We human beings constantly take input from around us - may it be an audio input or video input - this input goes into our memory where we attach labels to these inputs - may be good or bad - personal or professional (processing) and accordingly produce the output (respond to the external inputs).

In the same way - Computer too stores the input in memory, processes it and produces the output.

Memory is broadly divided into 2 categories - Primary Memory and Secondary Memory.

We will first elaborate on the Secondary Memory - 

Secondary memory (or secondary storage) is the slowest and cheapest form of memory. It cannot be processed directly by the CPU. It must first be copied into primary memory (Storage) which is also known as RAM. 
Secondary memory devices include magnetic disks like hard drives and floppy disks; optical disks such as CDs and DVDs; and magnetic tapes, which were the first forms of secondary memory. Nowadays - magnetic tapes are hardly used - mostly Hard Disk Drives, Pen Drives and CDs/DVDs are used. 
All your System Programs as well Application Programs reside on Secondary Memory.

As mentioned in the earlier discussion, Primary Memory many a times is referred to as Random Access Memory (RAM). This is the "MAIN" working memory used by the computer. When we switch on the computer, the Operating System programs are loaded or copied into this memory. So the speed of computer is faster if you have more RAM. 
Along with operating system programs, whatever applications we start in our system, they are loaded into this main working memory(RAM).
Please remember that the Data and Programs stored in RAM are volatile ( i.e. the information is lost when you switch off the computer) while the data stored on Secondary Memory devices does not get deleted when we switch off the computer. It permanently resides there unless somebody explicitly deletes it.', summary: 'In this section, you will learn -
a) Primary Memory
b) Secondary Memory', youtube_channel_url: '', topic_id: topic3.id)
content3.save(:validate => false)


topic4 = Topic.create(title: 'Basics', seq_number: '1', level_id: level2.id)
topic4.save!
content4 = Content.create(title: 'Basics', transcript: 'Hello Friends

Welcome to the programming Basics section. By now, I am sure that you are well-versed with the Computer Basics. And your visit to this section of site indicates that your interest & curiosity - both are increasing to know more. This time the curiosity is about Programming - a very fascinating word.  We appreciate this fact and will be happy in assisting you to have a smooth ride on a Programming Tour.

Do you remember we told you to keep the definition of Computer well in mind since we would need it while understanding what Programming is.

For those who don’t remember - lets revise it again - Computer is an electronic device which takes an input, processes it and produces the output. Also the hard fact is Computer in itself is a dumb machine.

One thing is sure that Computer being a dumb machine - we have to give instructions to Computer if we want any specific task to get done from it.

Simplifying this further - A set of instructions given to a computer to achieve or accomplish a specific task is nothing but a Program.

And this act of instructing a Computer is called Programming - sounds simple and interesting?

Ok, now I have one simple question for you all - what is the first and foremost criteria if we want to communicate with anybody in this world?

All of you may have different answers in your mind - but you will agree with the fact that "LANGUAGE" is the first and foremost criteria. That means any 2 persons who want to communicate with each other need to know a common language through which they can communicate.

Here is the catch - I hope you remember we said that Computer only understands the language of 0s and 1s.

And we human beings cannot speak in 0s and 1s.

So how are we going to communicate with Computer?

Here we introduce the concept of Programming Languages - A language which will help us communicate with a Computer.

There are many programming languages which have set of instructions in English language. And since we all understand English, we can use the instruction set of these programming languages and write our own programs.

Here I will like to introduce you with one more very frequently used term - Software though we have seen its definition in Level 1.

We already know what Program is - it’s the set of instructions given to a Computer to achieve or accomplish a specific task. Friends - Software is nothing but a set of such programs.

And programming languages are nothing but Application Software (Remember we already discussed this into Level 1 - Topic 2).

So as I said, there are many programming languages but our interest is Ruby.

And before going into details of Ruby as a programming langugage - we should be aware of the existing Programming Approaches or Methodologies.

Broadly there are 2 existing Programming Approaches - a) Structured way of Programming and b) Object oriented way of Programming.

There are some fundamental differences between these 2 approaches and instead of going into details - I will just like to mention one important difference here.

As compared to Structured Programming - we can easily relate the concepts in Object Oriented Programming with the real world objects and their interactions. And you will agree with the fact that any concept - when elaborated with a real life concept or scenario - is very easy to comprehend/understand.

The good news is Ruby - the language which we are planning to be in friendship with - is an Object Oriented Programming language. Hence we will have many real world examples on the go as we proceed further to understand Object Orientation in greater details.', summary: 'In this section, you will learn about -
a) What is a Program & Programming
b) Programming Approaches', youtube_channel_url: '', topic_id: topic4.id)
content4.save(:validate => false)

topic5 = Topic.create(title: 'Programming Elements & Constructs', seq_number: '2', level_id: level2.id)
topic5.save!
content5 = Content.create(title: 'Programming Elements & Constructs', transcript: 'So having understood the basics of programming - let us try to understand the basic elements of any programming language that help us do the actual programming.

Friends - Any program that we write does some kind of processing - but it does the processing on what - obviously the input that we provide. And what this input is - this input is nothing but some kind of DATA. So DATA is the most basic element of any programming language.

Now this DATA can be alphabets or numbers or combination of both. So to represent these different kinds of data, every programming language provides certain DATA TYPES.

Now from the knowledge that we have gained so far, let us assume that we are going to write one program which takes some input and processes it. You would agree with me that the Data (input) that our program processes must be stored somewhere in Memory. Suppose this program takes 2 items as input - then I need to store these 2 items in memory.  
Now consider this memory as a big cupboard with lot of shelves and these 2 items are stored somewhere in 2 different shelves. But how can we identify or find which these 2 shelves are out of many shelves and get the items quickly? For this we can label these shelves so that with the label we can easily find the item which we want. So in programming jargon - this shelf is nothing but the variable and the label given to this shelf is nothing but a variable name.

So a Variable is nothing but a location in memory which is reserved to store a specific data and can be used to store and retrieve this data by its LABEL. This LABEL is nothing but a Variable Name.

Now are you wondering why have we explicitly named this as a Variable? As of now just remember that the value of a variable may vary or change many a times - hence it is called as variable.

If we want to store the 2 input items into memory - which our program is going to process, then we may store these 2 input items into variables labeled as a and b. At this point this much explanation is sufficient to proceed further.

Now we are clear with 3 basic elements of any programming language - DATA, DATA TYPES and VARIABLES.

Let us understand now what are operators?

Suppose I want to add no’s 5 and 7. In arithmetic I would say like this -  "5 + 7".  This "5 + 7" is actually called an expression, the plus sign in this expression is called operator and 5 & 7 are called operands. 

In short every programming language supports different types of operators in order to evaluate different expressions. For e.g. plus, minus, multiply, division, remainder- these are arithmetic operators. Less than, greater than, less than or equal to, greater than or equal to , not equal to - these are relational operators. The relational operators come handy when we want to compare 2 values or operands with each other.
AND, OR, NOT - these are logical operators. Logical operators come handy when we want to evaluate multiple expressions at the same time. The usage of these operators would be more evident once we actually start Ruby Programming. Still just to feed your curiosity - here is a simple example. Suppose we have 3 variables named as a, b and c. If we want to check whether "a" is greatest among these 3 nos then we will write the expression as - "if a is greater than b AND a is greater than c". So this expression demonstrates usage of both relational and logical operators.

Friends - during the process of writing our own programs, we may come across the situations where we need to take a decision depending upon certain conditions. For e.g. suppose we are developing a software of online booking system for a travel agency. We have a condition that if user books his tickets before certain date - then he gets 10% discount - else he is not eligible for any discount. Have you observed carefully? There are 3 important words in this whole conversation - if - then - else, And in programming jargon - this is called as Conditional Construct - A construct which helps us taking decision depending upon certain conditon. In the same way, in programming, many a times we need to repeat certain set of steps again and again - so instead of writing them again and again - programming languages provide us the looping constructs which allow us to write the set of steps once only and execute or repeat them multiple times. For e.g. suppose I want computer to display a message "Welcome to Programming Basics Learning" 5 times on the screen. So one way is to write this message 5 times manually like - 

"Welcome to Programming Basics Learning"
"Welcome to Programming Basics Learning"
"Welcome to Programming Basics Learning"
"Welcome to Programming Basics Learning"
"Welcome to Programming Basics Learning"

But instead of doing this, I will ask computer to write "Welcome to Programming Basics Learning" 5 times. And the way computer achieves this writing 5 times is through the looping construct which actually has a feature to execute the same set of statements multiple times.', summary: 'In this section, you will learn about -
a) What are Data, Data Types and Variables
b) Conditional and Looping Constructs
c) Operators', youtube_channel_url: '', topic_id: topic5.id)
content5.save(:validate => false)

topic6 = Topic.create(title: 'Algorithm', seq_number: '3', level_id: level2.id)
topic6.save!
content6 = Content.create(title: 'Algorithm', transcript: 'So having understood the Programming Elements as DATA, DATA Types, Variables, Operators and Programming Constructs - we have everything to write a simple program - isn’t it? Oh - you must be thinking that I have not taught you a single word about Ruby as a programming language till now and expecting you to write a program? :)

No Friends - I don’t and won’t expect it from you. But we will like to share with you one very interesting and at the same time very important thing. It is a very good & recommended practice to first write set of steps in plain English language for solving a particular problem before writing an actual Program in any programming language. These set of steps written in plain English language for solving a particular problem is called an ALGORITHM. Once we write these set of steps for solving any particular problem - we know exactly what we want to achieve and how are we going to get it achieved from computer. So - morale of the story - always write an algorithm before writing an actual Program.

So let us write our first algorithm to add 2 numbers given by user & display the result of addition of these 2 numbers. 

What all things you will require for it - you will require 2 variables to hold the value of 2 no’s provided as input by user - suppose we name them as "a" & "b". We will also require a third variable for storing the value of the result of addition of these 2 no’s - lets name this variable as "c". And let us now try to write the set of steps - an algorithm - for achieving the desired result.

Step 1 - Ask user to input the value of first number to add. 

Step 2 - Store this value provided by user in variable "a". 

Step 3 - Ask user to input the value of second number to add.

Step 4 - Store this value provided by user in variable "b".

Step 5 - Add the value inside variable "a" and variable "b" & store this result into variable "c".

Step 6 - Show the value of variable "c" (which is actually the addition of 2 numbers that user did input through variable "a" & "b").

Sounds interesting friends?

To summarize - we are now comfortable with the basic elements of a Programming Language which are DATA, DATA Types, Variables, Operators and Programming Constructs. And we now also know what Algorithm is. 

Now let us try to write an algorithm to identify whether the given no is odd or even.  You also will need to help me in completing this algorithm. I will be asking you certain questions in between and we would proceed only when you give correct answers.

Step 1 - Input the value of variable "a" (Note - we are going to store the value of the no to be identified as odd or even into variable "a")', summary: 'In this section, you will learn about -
a) What is Algorithm
b) Sample Algorithm', youtube_channel_url: '', topic_id: topic6.id)
content6.save(:validate => false)

content7 = Content.create(title: "Algorithm", transcript: "So since you have correctly answered Question 1, 2 & 3, let us write step 2 

Step 2 - Divide variable 'a' by 2 and store the remainder of this division into variable 'b'.

Step 3 - if the value of variable 'b' is 0, then display variable 'a' as even number - else display variable 'a' as odd number.

So if you have understood the above algorithm correctly - I have a question for you.', summary: 'Sample Algorithm Continued...", youtube_channel_url: "", topic_id: topic6.id)
content7.save(:validate => false)


topic7 = Topic.create(title: 'Introduction to Classes and Objects', seq_number: '1', level_id: level3.id)
topic7.save!
content8 = Content.create(title: "Introduction to Classes and Objects", transcript: "Friends - In level 2 - we understood that Ruby is an Object Oriented Programming Language. For learning any Object Oriented Programming language - we need to understand some basic concepts of Object-Orientation. In Programming jargon - they are also called as Object Oriented Programming specification concepts or in short OOPS concepts.

But before proceeding to understand OOPS principles - will you please guess which thing could be at the core of any object oriented programming language? I am sure everybody of you must be able to answer this question and it’s Object. Object is at the core of any Object Oriented Programming language.

So what exactly is an Object? I guess everybody of us someday or other must have come across this terminology called Object.

Remember friends - the simplest definition of an object - Anything that can be seen with the necked eyes is an object. So with this as a definition - every physical thing in this world is an object.

For e.g myself is an object, Nitin is an object, Siddhant is an object, the table is an object, the fan is an object and the list is endless.

And if you give subtle attention, you will find that every object has certain characteristics and with the help of these characteristics it performs certain operations.

So when I say Nitin as an object - it has hands, legs, nose, ear and so on. So in Object Oriented terminology, these characteristics are called as Attributes of an Object.
With hand - Nitin writes & eats, with legs - he walks, with nose - he smells & with ear - he listens. So in OO terminology, these operations of writing, eating, walking are called behaviors.
So every object has certain attributes and behaviors.

Now tell me something - every human being has hands, legs, nose and ear and every human being writes, walks, smells & listens. So we can abstract out these common attributes and behaviors of all these human beings into a common/single entity. And this entity is nothing but a Class - another most important term in OO terminology. Wondering what abstract term is? Wait - we are going to elaborate this further.

So we can say Human Being is a Class. But it’s an abstract thing - I mean when I say human being - I don’t have a clear idea of anybody as such in front of me. But when I say Nitin or Siddhant or Sangapal - I have clear idea of these guys since they are concrete - not abstract.

So if Human Being is a class - then Nitin, Sangapal , Siddhant are instances/objects of this class.

One more example to clarify the concept of a class - You people must be aware of the Brick Manufacturing Unit where bricks are made. They create a single mould of brick - and out of this mould - they create multiple bricks. So though we cannot use the mould in construction, we definitely use the bricks created out of this mould in construction. So we can say the Mould is an abstract thing - a Class and all the bricks created out of these mould are concrete instances/Objects of this class.

I hope we are very much clear with the concept of Class and an Object now.", summary: "In this section, you will learn about -
a) What is Class and an Object?
b) Attributes and Behavior of an Object", youtube_channel_url: "http://youtu.be/rQaof2Yf490", topic_id: topic7.id)
content8.save(:validate => false)

topic8 = Topic.create(title: 'OOPS Concepts', seq_number: '2', level_id: level3.id)
topic8.save!
content9 = Content.create(title: "OOPS Concepts", transcript: "Now let us elaborate on 3 most important OOPS principles/concepts - Encapsulation, Inheritance and Polymorphism.

Encapsulation - Friends the name of this principle itself reveals what it means. Does the manufacture of a capsule (medicine) ever expose the contents inside the capsule to you or anybody taking it? It’s always wrapped in a nice cover and you bother to take the capsule as a whole without bothering the contents inside. But by taking the capsule - obviously you take the contents inside as well but you cannot alter/see/touch the contents.  So this way the manufacturer of a capsule encapsulates the contents inside.
In the same way the biggest advantage of Object Orientation is - the attributes of an Object are never exposed to the outside world - rather the operations acting on these attributes are exposed to the outside world and thus proving Encapsulation (Hiding the data inside).
To achieve this, whenever I design a class, I always make its attributes as private and expose only necessary behaviors as public so that any object in the outside world is not able to alter the attributes of this class but only able to use the functionality (behavior) exposed by this class.
More on this when we deal with actual examples using Ruby Programming language.

Inheritance - Again the name of this Object Orientation principle very much clarifies its meaning/purpose.  
Before going into technical details - let us try to understand inheritance through a real life example. You know Nitin, by the law of inheritance, inherits/gets all the properly created by his father. Also since he is an advocate in a District Court, through his income he bought a CAR - which gets added to the property he has inherited. So In short Nitin by default gets everything what his father has created - he does not have to take efforts for it - rather he has added to his inherited property by buying a CAR.
Now let us try to relate it to the Object Orientation Programming world. 
As explained above, Human Being is a class and Nitin is an Object of this class. So by the definition of inheritance - Nitin inherits all the properties/attributes and behaviors of a Human Being Class. But Nitin has one more skill - singing. So Nitin, along with all the behaviors inherited from Human being class, also exhibits an extra behavior and that is singing.

Friends - remember - one of the most powerful features of any OO programming language is code reuse i.e. using the existing code if required further - and if you have understood our discussion so far, you would have realized by now that Inheritance is one of the ways to reuse the existing code.

Polymorphism - This is another important Object Orientation principle. Polymorphism is a Greek word and its literal meaning is Many Shapes or Many Forms. So If I want to define Polymorphism in technical terms - then it’s an ability of the same object or similar objects to behave or respond to the same message differently under different situations or different contexts.
Let us try to understand this with a real life example and we will refer to our same Person Object - Nitin.
Nitin as a person object works as an advocate in a District Court.
When Nitin is present in a Court, his behavior or response is different since he is playing the role of an Advocate.
When Nitin is playing with his 2 years old kid, his behavior or response is different since he is playing the role of Father.
When Nitin is interacting with his wife, his behavior or response must be different since he is playing the role of an obedient husband. :)
When Nitin is interacting with his parents, his behavior or response is different since he is playing the role of a son.

So if you observe, the same Nitin as a Human Being object, responds or behaves differently under different contexts or playing multiple roles under different contexts or situations and this is nothing but Polymorphism.
Now let us take one technical example - suppose you have a system with many shapes like Circle, Rectangle & Square. So these are all kind of Shapes only and hence we can say that they are kind of similar objects which belong to a Shape category or Shape Class. When you send a message 'draw' to all these 3 objects, they all are drawn differently. Similar objects responding differently to the same message and thus proving the concept of Polymorphism.

Now the most important thing - you must have noticed that while we were learning programming basics, we told you that the biggest difference between structured way of programming and object oriented programming is we can easily relate all the concepts in OO paradigm with real life scenarios making it more easy to understand and learn. From the very start of educating you with Object Orientation - we have kept this promise to give you real life analogous examples - rather OO itself helped us in achieving this.

So having discussed enough about Object Orientation, let us now mark our journey on 'Ruby' - one of the fascinating OO Programming languages. And the enthusiasm as well the participation that you have shown so far - we are sure - you would love this Ruby Programming Tour which will slowly step up on the track of Rails Framework.", summary: "In this section, you will learn about -
a) Encapsulation
b) Inheritance
c) Polymorphism", youtube_channel_url: "http://youtu.be/CEC2IYtZ848", topic_id: topic8.id)
content9.save(:validate => false)
