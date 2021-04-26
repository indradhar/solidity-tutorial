pragma solidity ^0.5.0;
contract Student_Mapping
{
    struct Student
    {
        uint roll;
        string name;
        int mark1;
        int mark2;
        int mark3;
        int per;
        bool reg_status;
    }
    
    mapping(uint=>Student) public studentData;   //Mapping with the help of key roll which has uint type. //Hash table gas name studentData
   
    uint roll1=0;
    int per1;
    
    function enrollStudent(int m1, int m2, int m3, string memory n) public
    {
        per1=(m1+m2+m3)/3;
        if(per1>60)
        {
            roll1++;
            studentData[roll1]=Student(roll1,n,m1,m2,m3,per1,true);
        }
    }
    
    function repeatResult(uint r,int m1,int m2,int m3) public
    {
        Student memory student_ref=studentData[r];  //storing the student data into a struct variable student_ref
        student_ref.mark1=m1; //updating marks
        student_ref.mark2=m2;
        student_ref.mark3=m3;
        
        per1=(m1+m2+m3)/3;
        student_ref.per=per1;
        
        if(per1<60)
        {
            student_ref.reg_status=false;
        }
        else
        {
            student_ref.reg_status=true;
        }
        
        studentData[r]=student_ref;
    }
    
}