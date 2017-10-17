using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WesternSydneyHotel.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace WesternSydneyHotel.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                    manager.AddToRole(user.Id, "customers");
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString);
                    using (conn)
                    {
                        conn.Open();
                        string insertCustomer =
                            "INSERT INTO customers(username,gname,sname,address,state,suburb,postcode,mobile) VALUES (@username,@gname,@sname,@address,@state,@suburb,@postcode,@mobile);";
                        SqlCommand comm = new SqlCommand(insertCustomer, conn);
                        comm.Parameters.AddWithValue("@username", Email.Text);
                        comm.Parameters.AddWithValue("@gname", txtGivenName.Text);
                        comm.Parameters.AddWithValue("@sname", txtFamilyName.Text);
                        comm.Parameters.AddWithValue("@address", txtAddress.Text);
                        comm.Parameters.AddWithValue("@state", DDLState.SelectedValue);
                        comm.Parameters.AddWithValue("@suburb", txtSuburb.Text);
                        comm.Parameters.AddWithValue("@postcode", txtPostcode.Text);
                        comm.Parameters.AddWithValue("@mobile", txtMobile.Text);

                        int rowEffect = comm.ExecuteNonQuery();
                        if (rowEffect != 0)
                        {
                            signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                        }
                        else
                        {
                        ErrorMessage.Text = result.Errors.FirstOrDefault();
                    }
                }                
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}