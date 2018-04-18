using DockerCI.Controllers;
using System;
using Xunit;

namespace DockerCITests
{
    public class TestGstController
    {
        [Fact]
        public void GetGstTax()
        {
            var gstController = new GstController();

            var returnValue = gstController.GetGstTax(10);

            Assert.Equal(0.6m, returnValue);
        }
    }
}
